import 'package:flutter/material.dart';

import 'package:wallet_monitor/generated/l10n.dart';

import 'package:wallet_monitor/src/db/query/currency.query.dart';
import 'package:wallet_monitor/src/db/models/currency.model.dart';
import 'package:wallet_monitor/src/helper/argument.helper.dart';
import 'package:wallet_monitor/src/helper/constants/icon.constants.dart';
import 'package:wallet_monitor/src/helper/currency.helper.dart';
import 'package:wallet_monitor/src/widgets/application_body.widget.dart';
import 'package:wallet_monitor/src/widgets/custom_app_bar.widget.dart';
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
  late List<CurrencyModel?> _allCurrencies = [];
  late CurrencyModel? _currencySelected;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: S.current.cash);
    _descriptionController = TextEditingController();
    _currencySelected = widget.args.account?.currency;
    _getAllCurrencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _getAllCurrencies() async {
    _allCurrencies = await CurrencyQuery.getAll();
    if (_currencySelected == null) {
      _currencySelected =
          _allCurrencies.where((currency) => currency!.id == 103).first;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBodyWidget(
      title: S.current.newAccount,
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
    // return Scaffold(
    //   body: CustomAppBar(
    //     title: S.current.newAccount,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         _inputName(),
    //         _descriptionContainer(),
    //         _currencySelector(),
    //       ],
    //     ),
    //   ),
    // );
  }

  CustomTextFormField _inputName() {
    return CustomTextFormField(
      controller: _nameController,
      label: S.current.accountName,
      margin: const EdgeInsets.all(10.0),
    );
  }

  Widget _descriptionContainer() {
    return CustomContainerWidget(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      color: Theme.of(context).colorScheme.primary,
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
            // TODO: change the next component
            child: Icon(
              Icons.question_mark_outlined,
              size: 40,
            ),
          ),
        ),
        const SizedBox(height: 16),
        IconButton(
          onPressed: () {},
          icon: Icon(IconConstants.picker),
        ),
      ],
    );
  }

  Widget _inputDescription() {
    return Expanded(
      child: CustomTextFormField(
        controller: _descriptionController,
        label: S.current.description,
        maxLines: 5,
        shadowColor: Colors.transparent,
      ),
    );
  }

  Widget _currencySelector() {
    return CustomContainerWidget(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(_currencySelected?.symbol ?? ""),
          const SizedBox(width: 10),
          Text(_currencySelected!.name),
          const Expanded(child: SizedBox()),
          const Icon(Icons.arrow_drop_down_rounded)
        ],
      ),
    );
  }
}
