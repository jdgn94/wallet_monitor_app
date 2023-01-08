import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/db/index.dart';

import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_message.dart';
import 'package:wallet_monitor/src/util/icons.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';
import 'package:wallet_monitor/src/widgets/text_field_global.dart';

class AddCurrency extends StatefulWidget {
  final Rect buttonRect;
  final Currency? currency;

  const AddCurrency({super.key, required this.buttonRect, this.currency});

  @override
  State<AddCurrency> createState() => _AddCurrencyState();
}

class _AddCurrencyState extends State<AddCurrency>
    with SingleTickerProviderStateMixin {
  final _db = DB();
  final colorSchema = ColorSchemaApp();
  late AnimationController _animationController;
  late Animation _buttonController;
  late TextEditingController _currencyNameController;
  late TextEditingController _symbolNameController;
  late double buttonWidth;
  late double buttonHeight;
  bool savedChanges = false;
  bool animationEnd = false;
  bool editCurrency = false;

  @override
  void initState() {
    super.initState();
    _currencyNameController = TextEditingController();
    _symbolNameController = TextEditingController();
    if (widget.currency != null) {
      _currencyNameController.text = widget.currency!.name;
      _symbolNameController.text = widget.currency!.symbol;
      editCurrency = true;
    }
    buttonWidth = widget.currency != null
        ? window.physicalSize.shortestSide
        : window.physicalSize.shortestSide * .2 - 10;
    buttonHeight = widget.currency != null ? 40 : 55;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _buttonController = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _animationController.addListener(() {
      setState(() {
        buttonWidth = editCurrency
            ? MediaQuery.of(context).size.width
            : ((MediaQuery.of(context).size.width * .2 - 10) +
                (MediaQuery.of(context).size.width *
                    .6 *
                    _buttonController.value));
        buttonHeight =
            (editCurrency ? 55.0 : 40.0) + (230.0 * _buttonController.value);
      });
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        if (savedChanges) {
          return Navigator.of(context).pop({
            "message": widget.currency != null
                ? S.current.editCurrencySuccess
                : S.current.createCurrencySuccess,
            "status": "success"
          });
        }
        return Navigator.of(context).pop(null);
        // if (savedChanges) {
        //   AppMessage.buildMessageSnackbar(
        //     context,
        //     S.current.createCurrencySuccess,
        //     "success",
        //   );
        // }
      }

      if (status == AnimationStatus.completed) {
        animationEnd = true;
      }

      if (status == AnimationStatus.reverse) {
        animationEnd = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _currencyNameController.dispose();
    _symbolNameController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    final currencyName = _currencyNameController.text;
    final symbolName = _symbolNameController.text;

    if (currencyName.isEmpty || symbolName.isEmpty) {
      AppMessage.buildMessageSnackbar(
          context, S.current.createCurrencyError, "error");
      return;
    }

    if (editCurrency) {
      await _db.putCurrency(widget.currency!.id, currencyName, symbolName);
    } else {
      await _db.setCurrency(currencyName, symbolName);
    }
    savedChanges = true;
    _animationController.reverse();
  }

  Color _animatedColor() {
    final baseColor = editCurrency
        ? Theme.of(context).scaffoldBackgroundColor
        : colorSchema.primary;
    final otherColor = Theme.of(context).dialogBackgroundColor;
    final red = baseColor.red - otherColor.red;
    final blue = baseColor.blue - otherColor.blue;
    final green = baseColor.green - otherColor.green;

    return Color.fromRGBO(
      baseColor.red - (red * _animationController.value).toInt(),
      baseColor.green - (green * _animationController.value).toInt(),
      baseColor.blue - (blue * _animationController.value).toInt(),
      1,
    );
  }

  Color _colorText() {
    final themeDark = Theme.of(context).brightness == Brightness.dark;
    if (themeDark) {
      return Colors.white.withOpacity(1 - _animationController.value);
    }

    return Colors.black.withOpacity(1 - _animationController.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black.withOpacity(0.5 * _animationController.value),
      body: Stack(
        children: [
          _buttonToTransform(),
        ],
      ),
    );
  }

  Widget _buttonToTransform() {
    final heightBase = editCurrency ? 55 : 40;
    final w = MediaQuery.of(context).size.width;
    final wAdded = w - 600;
    return Positioned(
      top: widget.buttonRect.top -
          (widget.buttonRect.top * _buttonController.value),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: heightBase +
            (MediaQuery.of(context).size.height - heightBase) *
                _buttonController.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: 600 + (wAdded - wAdded * _buttonController.value)),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Ink(
                width: buttonWidth,
                height: buttonHeight,
                decoration: BoxDecoration(
                  color: _animatedColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: EdgeInsets.all(10.0 * _buttonController.value),
                child: animationEnd ? _boxItems() : _expandingContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxItems() {
    return Column(
      children: [
        _title(),
        _formContainer(),
        _actionsButtons(),
      ],
    );
  }

  Widget _expandingContent() {
    if (editCurrency) {
      return SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.currency!.name,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: _colorText(),
              ),
            ),
            Text(
              widget.currency!.symbol,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: _colorText(),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Icon(
        getIcon('add'),
        color: Colors.white,
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        editCurrency ? S.current.editCurrency : S.current.createCurrency,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _formContainer() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFieldGlobal(
              textEditingController: _currencyNameController,
              label: S.current.currency,
            ),
            TextFieldGlobal(
              textEditingController: _symbolNameController,
              label: S.current.symbol,
              maxLength: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionsButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButtonGlobal(
          callback: () => _animationController.reverse(),
          text: S.current.dialogCancelTextBottom,
          textColor: colorSchema.error,
          backgroundColor: colorSchema.error,
          size: const Size(100.0, 44.0),
        ),
        TextButtonGlobal(
          callback: () => _saveChanges(),
          text: S.current.dialogConfirmTextBottom,
          textColor: colorSchema.success,
          backgroundColor: colorSchema.success,
          size: const Size(100.0, 44.0),
        ),
      ],
    );
  }
}
