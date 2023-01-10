// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Use without account`
  String get noAccount {
    return Intl.message(
      'Use without account',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in without account?`
  String get dialogNoAccountTitle {
    return Intl.message(
      'Log in without account?',
      name: 'dialogNoAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `To use application without account is not posible view data in web application.`
  String get dialogNoAccountText {
    return Intl.message(
      'To use application without account is not posible view data in web application.',
      name: 'dialogNoAccountText',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get dialogConfirmTextBottomDefault {
    return Intl.message(
      'Ok',
      name: 'dialogConfirmTextBottomDefault',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get dialogCancelTextBottomDefault {
    return Intl.message(
      'Close',
      name: 'dialogCancelTextBottomDefault',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get dialogConfirmTextBottom {
    return Intl.message(
      'Save',
      name: 'dialogConfirmTextBottom',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get dialogCancelTextBottom {
    return Intl.message(
      'Cancel',
      name: 'dialogCancelTextBottom',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username`
  String get emailUsername {
    return Intl.message(
      'Email or Username',
      name: 'emailUsername',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Requirements`
  String get requirements {
    return Intl.message(
      'Requirements',
      name: 'requirements',
      desc: '',
      args: [],
    );
  }

  /// `The username is not valid, character accepted (a-z 0-9 . _ -).`
  String get usernameError {
    return Intl.message(
      'The username is not valid, character accepted (a-z 0-9 . _ -).',
      name: 'usernameError',
      desc: '',
      args: [],
    );
  }

  /// `The username is valid.`
  String get usernameSuccess {
    return Intl.message(
      'The username is valid.',
      name: 'usernameSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The username is not valid.`
  String get usernameErrorInput {
    return Intl.message(
      'The username is not valid.',
      name: 'usernameErrorInput',
      desc: '',
      args: [],
    );
  }

  /// `The email is not valid.`
  String get emailError {
    return Intl.message(
      'The email is not valid.',
      name: 'emailError',
      desc: '',
      args: [],
    );
  }

  /// `The email is valid.`
  String get emailSuccess {
    return Intl.message(
      'The email is valid.',
      name: 'emailSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The email is not valid.`
  String get emailErrorInput {
    return Intl.message(
      'The email is not valid.',
      name: 'emailErrorInput',
      desc: '',
      args: [],
    );
  }

  /// `The password is not valid.`
  String get passwordError {
    return Intl.message(
      'The password is not valid.',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `The password is valid.`
  String get passwordSuccess {
    return Intl.message(
      'The password is valid.',
      name: 'passwordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The password is not valid.`
  String get passwordErrorInput {
    return Intl.message(
      'The password is not valid.',
      name: 'passwordErrorInput',
      desc: '',
      args: [],
    );
  }

  /// `Lower letter required.`
  String get passwordErrorRequirementLower {
    return Intl.message(
      'Lower letter required.',
      name: 'passwordErrorRequirementLower',
      desc: '',
      args: [],
    );
  }

  /// `Lower letter are allowed.`
  String get passwordSuccessRequirementLower {
    return Intl.message(
      'Lower letter are allowed.',
      name: 'passwordSuccessRequirementLower',
      desc: '',
      args: [],
    );
  }

  /// `Upper letter required.`
  String get passwordErrorRequirementUpper {
    return Intl.message(
      'Upper letter required.',
      name: 'passwordErrorRequirementUpper',
      desc: '',
      args: [],
    );
  }

  /// `Upper letter are allowed.`
  String get passwordSuccessRequirementUpper {
    return Intl.message(
      'Upper letter are allowed.',
      name: 'passwordSuccessRequirementUpper',
      desc: '',
      args: [],
    );
  }

  /// `Number is required.`
  String get passwordErrorRequirementNumber {
    return Intl.message(
      'Number is required.',
      name: 'passwordErrorRequirementNumber',
      desc: '',
      args: [],
    );
  }

  /// `Number are allowed.`
  String get passwordSuccessRequirementNumber {
    return Intl.message(
      'Number are allowed.',
      name: 'passwordSuccessRequirementNumber',
      desc: '',
      args: [],
    );
  }

  /// `Special character required ($@!%*?&#._-).`
  String get passwordErrorRequirementSpecial {
    return Intl.message(
      'Special character required (\$@!%*?&#._-).',
      name: 'passwordErrorRequirementSpecial',
      desc: '',
      args: [],
    );
  }

  /// `Special character are allowed.`
  String get passwordSuccessRequirementSpecial {
    return Intl.message(
      'Special character are allowed.',
      name: 'passwordSuccessRequirementSpecial',
      desc: '',
      args: [],
    );
  }

  /// `Characters length between 8 and 64.`
  String get passwordErrorRequirementLength {
    return Intl.message(
      'Characters length between 8 and 64.',
      name: 'passwordErrorRequirementLength',
      desc: '',
      args: [],
    );
  }

  /// `Characters length are allowed.`
  String get passwordSuccessRequirementLength {
    return Intl.message(
      'Characters length are allowed.',
      name: 'passwordSuccessRequirementLength',
      desc: '',
      args: [],
    );
  }

  /// `Email/Username or password is not correct.`
  String get logInError {
    return Intl.message(
      'Email/Username or password is not correct.',
      name: 'logInError',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get es {
    return Intl.message(
      'Spanish',
      name: 'es',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get jan {
    return Intl.message(
      'January',
      name: 'jan',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get feb {
    return Intl.message(
      'February',
      name: 'feb',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get mar {
    return Intl.message(
      'March',
      name: 'mar',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get apr {
    return Intl.message(
      'April',
      name: 'apr',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get jun {
    return Intl.message(
      'June',
      name: 'jun',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get jul {
    return Intl.message(
      'July',
      name: 'jul',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get aug {
    return Intl.message(
      'August',
      name: 'aug',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get sep {
    return Intl.message(
      'September',
      name: 'sep',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get oct {
    return Intl.message(
      'October',
      name: 'oct',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get nov {
    return Intl.message(
      'November',
      name: 'nov',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get dic {
    return Intl.message(
      'December',
      name: 'dic',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get sale {
    return Intl.message(
      'Sale',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Commission`
  String get commission {
    return Intl.message(
      'Commission',
      name: 'commission',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get food {
    return Intl.message(
      'Food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Games`
  String get games {
    return Intl.message(
      'Games',
      name: 'games',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get entertainment {
    return Intl.message(
      'Entertainment',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Gas`
  String get gas {
    return Intl.message(
      'Gas',
      name: 'gas',
      desc: '',
      args: [],
    );
  }

  /// `Parking`
  String get parking {
    return Intl.message(
      'Parking',
      name: 'parking',
      desc: '',
      args: [],
    );
  }

  /// `Electronic`
  String get electronic {
    return Intl.message(
      'Electronic',
      name: 'electronic',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeCategory {
    return Intl.message(
      'Home',
      name: 'homeCategory',
      desc: '',
      args: [],
    );
  }

  /// `Accessories`
  String get accessories {
    return Intl.message(
      'Accessories',
      name: 'accessories',
      desc: '',
      args: [],
    );
  }

  /// `Present`
  String get present {
    return Intl.message(
      'Present',
      name: 'present',
      desc: '',
      args: [],
    );
  }

  /// `Loan`
  String get loan {
    return Intl.message(
      'Loan',
      name: 'loan',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Car Service`
  String get car {
    return Intl.message(
      'Car Service',
      name: 'car',
      desc: '',
      args: [],
    );
  }

  /// `Cleaning`
  String get cleaning {
    return Intl.message(
      'Cleaning',
      name: 'cleaning',
      desc: '',
      args: [],
    );
  }

  /// `Bank`
  String get bank {
    return Intl.message(
      'Bank',
      name: 'bank',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Digital`
  String get digital {
    return Intl.message(
      'Digital',
      name: 'digital',
      desc: '',
      args: [],
    );
  }

  /// `Crypto`
  String get crypto {
    return Intl.message(
      'Crypto',
      name: 'crypto',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Total Expenses`
  String get totalExpenses {
    return Intl.message(
      'Total Expenses',
      name: 'totalExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Total Payments`
  String get totalPayments {
    return Intl.message(
      'Total Payments',
      name: 'totalPayments',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expenses {
    return Intl.message(
      'Expenses',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `Profits`
  String get profits {
    return Intl.message(
      'Profits',
      name: 'profits',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Currencies`
  String get currencies {
    return Intl.message(
      'Currencies',
      name: 'currencies',
      desc: '',
      args: [],
    );
  }

  /// `Create Currency`
  String get createCurrency {
    return Intl.message(
      'Create Currency',
      name: 'createCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Edit Currency`
  String get editCurrency {
    return Intl.message(
      'Edit Currency',
      name: 'editCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Data is missing to create currency.`
  String get createCurrencyError {
    return Intl.message(
      'Data is missing to create currency.',
      name: 'createCurrencyError',
      desc: '',
      args: [],
    );
  }

  /// `Currency create.`
  String get createCurrencySuccess {
    return Intl.message(
      'Currency create.',
      name: 'createCurrencySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Data is missing to edit currency.`
  String get editCurrencyError {
    return Intl.message(
      'Data is missing to edit currency.',
      name: 'editCurrencyError',
      desc: '',
      args: [],
    );
  }

  /// `Currency edit.`
  String get editCurrencySuccess {
    return Intl.message(
      'Currency edit.',
      name: 'editCurrencySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Symbol`
  String get symbol {
    return Intl.message(
      'Symbol',
      name: 'symbol',
      desc: '',
      args: [],
    );
  }

  /// `Created at`
  String get createdAt {
    return Intl.message(
      'Created at',
      name: 'createdAt',
      desc: '',
      args: [],
    );
  }

  /// `Updated at`
  String get updatedAt {
    return Intl.message(
      'Updated at',
      name: 'updatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get hide {
    return Intl.message(
      'Hide',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Add Transaction`
  String get addTransaction {
    return Intl.message(
      'Add Transaction',
      name: 'addTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Transaction type`
  String get transactionType {
    return Intl.message(
      'Transaction type',
      name: 'transactionType',
      desc: '',
      args: [],
    );
  }

  /// `Currency not selected.`
  String get currencyNoSelected {
    return Intl.message(
      'Currency not selected.',
      name: 'currencyNoSelected',
      desc: '',
      args: [],
    );
  }

  /// `Categories not selected.`
  String get categoryNoSelected {
    return Intl.message(
      'Categories not selected.',
      name: 'categoryNoSelected',
      desc: '',
      args: [],
    );
  }

  /// `Amount not found.`
  String get amountNoFound {
    return Intl.message(
      'Amount not found.',
      name: 'amountNoFound',
      desc: '',
      args: [],
    );
  }

  /// `Transaction without description.`
  String get noDescription {
    return Intl.message(
      'Transaction without description.',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `No Currencies.`
  String get noCurrencies {
    return Intl.message(
      'No Currencies.',
      name: 'noCurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Banks`
  String get banks {
    return Intl.message(
      'Banks',
      name: 'banks',
      desc: '',
      args: [],
    );
  }

  /// `No Banks`
  String get noBanks {
    return Intl.message(
      'No Banks',
      name: 'noBanks',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
