import 'package:flutter/material.dart';

import 'package:wallet_monitor/generated/l10n.dart';

import 'package:wallet_monitor/src/db/query/currency.query.dart';
import 'package:wallet_monitor/src/dialogs/color_selector.dialog.dart';
import 'package:wallet_monitor/src/dialogs/currency.dialog.dart';
import 'package:wallet_monitor/src/helper/argument.helper.dart';
import 'package:wallet_monitor/src/helper/constants/icon.constants.dart';
import 'package:wallet_monitor/src/widgets/application_body.widget.dart';
import 'package:wallet_monitor/src/widgets/custom_container.widget.dart';
import 'package:wallet_monitor/src/widgets/custom_text_form_field.dart';

class CreateAccountScreen extends StatefulWidget {
  final AccountArguments args;

  const CreateAccountScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _currencyController;
  late CurrencyModel? _currencySelected;
  late FocusNode _nameFocus;
  late FocusNode _currencyFocus;
  late Color? _colorAccount;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: S.current.cash);
    _descriptionController = TextEditingController();
    _currencyController = TextEditingController();
    _nameFocus = FocusNode();
    _nameFocus.addListener(() => setState(() {}));
    _currencyFocus = FocusNode();
    _currencyFocus.addListener(() => setState(() {}));
    _currencySelected = widget.args.account?.currency;
    if (_currencySelected != null) {
      _changeCurrencyValue(widget.args.account!.currency);
    } else {
      _getDefaultCurrency();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _currencyController.dispose();
    _descriptionController.dispose();
    _nameFocus.dispose();
    _currencyFocus.dispose();
    super.dispose();
  }

  Future<void> _getDefaultCurrency() async {
    final currency = await CurrencyQuery.getById(103);
    _changeCurrencyValue(currency);
  }

  void _changeCurrencyValue(CurrencyModel currency) {
    _currencyController.text = "${currency.symbol} ${currency.name}";
    _currencySelected = currency;
    setState(() {});
  }

  void _changeAccountColor(Color color) {
    setState(() {
      _colorAccount = color;
    });
  }

  void _openCurrencyDialog() {
    showDialogCurrencies(
      context,
      _changeCurrencyValue,
      currencySelect: _currencySelected!.id,
    );
  }

  void _openColorDialog() {
    showDialogColorSelector(context, _changeAccountColor, _colorAccount!);
  }

  @override
  Widget build(BuildContext context) {
    _colorAccount = _colorAccount ?? Theme.of(context).colorScheme.primary;

    return ApplicationBodyWidget(
      title: S.current.newAccount,
      color: _colorAccount,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputName(),
          _descriptionContainer(),
          _currencySelector(),
        ],
      ),
    );
  }

  CustomTextFormField _inputName() {
    return CustomTextFormField(
      controller: _nameController,
      focusNode: _nameFocus,
      label: S.current.accountName,
    );
  }

  Widget _descriptionContainer() {
    return CustomContainerWidget(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      color: _colorAccount,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _iconSelector(),
          const SizedBox(width: 10),
          _inputDescription(),
        ],
      ),
    );
  }

  Widget _iconSelector() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomContainerWidget(
          onTap: () {},
          width: 80,
          height: 80,
          shadowColor: Colors.transparent,
          color: Theme.of(context).colorScheme.background,
          child: const Center(
            // REMEMBER: change the next component
            child: Icon(
              Icons.question_mark_outlined,
              size: 40,
            ),
          ),
        ),
        const SizedBox(height: 16),
        IconButton(
          onPressed: _openColorDialog,
          icon: Icon(IconConstants.picker),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.background,
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputDescription() {
    return Expanded(
      child: CustomTextFormField(
        controller: _descriptionController,
        label: S.current.description,
        margin: EdgeInsets.zero,
        maxLines: 5,
        shadowColor: Colors.transparent,
        textInputType: TextInputType.multiline,
      ),
    );
  }

  CustomTextFormField _currencySelector() {
    return CustomTextFormField(
      controller: _currencyController,
      focusNode: _currencyFocus,
      suffixIcon: Icons.arrow_drop_down_rounded,
      onTap: _openCurrencyDialog,
      readOnly: true,
    );
  }
}
