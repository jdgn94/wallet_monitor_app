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
