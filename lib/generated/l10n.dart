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

  /// `Accounts`
  String get accounts {
    return Intl.message(
      'Accounts',
      name: 'accounts',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Budgets`
  String get budgets {
    return Intl.message(
      'Budgets',
      name: 'budgets',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Settings & Customization`
  String get settingsAndCustomization {
    return Intl.message(
      'Settings & Customization',
      name: 'settingsAndCustomization',
      desc: '',
      args: [],
    );
  }

  /// `Net Worth`
  String get netWorth {
    return Intl.message(
      'Net Worth',
      name: 'netWorth',
      desc: '',
      args: [],
    );
  }

  /// `Incomes`
  String get incomes {
    return Intl.message(
      'Incomes',
      name: 'incomes',
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

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Wallet Monitor`
  String get welcome {
    return Intl.message(
      'Welcome to Wallet Monitor',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Select your language`
  String get selectLanguage {
    return Intl.message(
      'Select your language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
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

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
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

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
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

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
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

  /// `Create New Account`
  String get newAccount {
    return Intl.message(
      'Create New Account',
      name: 'newAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account Name`
  String get accountName {
    return Intl.message(
      'Account Name',
      name: 'accountName',
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

  /// `AlbaniaLek`
  String get AlbaniaLek {
    return Intl.message(
      'AlbaniaLek',
      name: 'AlbaniaLek',
      desc: '',
      args: [],
    );
  }

  /// `Afghanistan Afghani`
  String get AfghanistanAfghani {
    return Intl.message(
      'Afghanistan Afghani',
      name: 'AfghanistanAfghani',
      desc: '',
      args: [],
    );
  }

  /// `Argentina Peso`
  String get ArgentinaPeso {
    return Intl.message(
      'Argentina Peso',
      name: 'ArgentinaPeso',
      desc: '',
      args: [],
    );
  }

  /// `Aruba Guilder`
  String get ArubaGuilder {
    return Intl.message(
      'Aruba Guilder',
      name: 'ArubaGuilder',
      desc: '',
      args: [],
    );
  }

  /// `Australia Dollar`
  String get AustraliaDollar {
    return Intl.message(
      'Australia Dollar',
      name: 'AustraliaDollar',
      desc: '',
      args: [],
    );
  }

  /// `Azerbaijan Manat`
  String get AzerbaijanManat {
    return Intl.message(
      'Azerbaijan Manat',
      name: 'AzerbaijanManat',
      desc: '',
      args: [],
    );
  }

  /// `Bahamas Dollar`
  String get BahamasDollar {
    return Intl.message(
      'Bahamas Dollar',
      name: 'BahamasDollar',
      desc: '',
      args: [],
    );
  }

  /// `Barbados Dollar`
  String get BarbadosDollar {
    return Intl.message(
      'Barbados Dollar',
      name: 'BarbadosDollar',
      desc: '',
      args: [],
    );
  }

  /// `Belarus Ruble`
  String get BelarusRuble {
    return Intl.message(
      'Belarus Ruble',
      name: 'BelarusRuble',
      desc: '',
      args: [],
    );
  }

  /// `Belize Dollar`
  String get BelizeDollar {
    return Intl.message(
      'Belize Dollar',
      name: 'BelizeDollar',
      desc: '',
      args: [],
    );
  }

  /// `Bermuda Dollar`
  String get BermudaDollar {
    return Intl.message(
      'Bermuda Dollar',
      name: 'BermudaDollar',
      desc: '',
      args: [],
    );
  }

  /// `Bolivia Boliviano`
  String get BoliviaBoliviano {
    return Intl.message(
      'Bolivia Boliviano',
      name: 'BoliviaBoliviano',
      desc: '',
      args: [],
    );
  }

  /// `Bosnia and Herzegovina Convertible Mark`
  String get BosniaAndHerzegovinaConvertibleMark {
    return Intl.message(
      'Bosnia and Herzegovina Convertible Mark',
      name: 'BosniaAndHerzegovinaConvertibleMark',
      desc: '',
      args: [],
    );
  }

  /// `Botswana Pula`
  String get BotswanaPula {
    return Intl.message(
      'Botswana Pula',
      name: 'BotswanaPula',
      desc: '',
      args: [],
    );
  }

  /// `Bulgaria Lev`
  String get BulgariaLev {
    return Intl.message(
      'Bulgaria Lev',
      name: 'BulgariaLev',
      desc: '',
      args: [],
    );
  }

  /// `Brazil Real`
  String get BrazilReal {
    return Intl.message(
      'Brazil Real',
      name: 'BrazilReal',
      desc: '',
      args: [],
    );
  }

  /// `Brunei Darussalam Dollar`
  String get BruneiDarussalamDollar {
    return Intl.message(
      'Brunei Darussalam Dollar',
      name: 'BruneiDarussalamDollar',
      desc: '',
      args: [],
    );
  }

  /// `Cambodia Riel`
  String get CambodiaRiel {
    return Intl.message(
      'Cambodia Riel',
      name: 'CambodiaRiel',
      desc: '',
      args: [],
    );
  }

  /// `Canada Dollar`
  String get CanadaDollar {
    return Intl.message(
      'Canada Dollar',
      name: 'CanadaDollar',
      desc: '',
      args: [],
    );
  }

  /// `Cayman Islands Dollar`
  String get CaymanIslandsDollar {
    return Intl.message(
      'Cayman Islands Dollar',
      name: 'CaymanIslandsDollar',
      desc: '',
      args: [],
    );
  }

  /// `Chile Peso`
  String get ChilePeso {
    return Intl.message(
      'Chile Peso',
      name: 'ChilePeso',
      desc: '',
      args: [],
    );
  }

  /// `China Yuan Renminbi`
  String get ChinaYuanRenminbi {
    return Intl.message(
      'China Yuan Renminbi',
      name: 'ChinaYuanRenminbi',
      desc: '',
      args: [],
    );
  }

  /// `Colombia Peso`
  String get ColombiaPeso {
    return Intl.message(
      'Colombia Peso',
      name: 'ColombiaPeso',
      desc: '',
      args: [],
    );
  }

  /// `Costa Rica Colon`
  String get CostaRicaColon {
    return Intl.message(
      'Costa Rica Colon',
      name: 'CostaRicaColon',
      desc: '',
      args: [],
    );
  }

  /// `Croatia Kuna`
  String get CroatiaKuna {
    return Intl.message(
      'Croatia Kuna',
      name: 'CroatiaKuna',
      desc: '',
      args: [],
    );
  }

  /// `Cuba Peso`
  String get CubaPeso {
    return Intl.message(
      'Cuba Peso',
      name: 'CubaPeso',
      desc: '',
      args: [],
    );
  }

  /// `Czech Republic Koruna`
  String get CzechRepublicKoruna {
    return Intl.message(
      'Czech Republic Koruna',
      name: 'CzechRepublicKoruna',
      desc: '',
      args: [],
    );
  }

  /// `Denmark Krone`
  String get DenmarkKrone {
    return Intl.message(
      'Denmark Krone',
      name: 'DenmarkKrone',
      desc: '',
      args: [],
    );
  }

  /// `Dominican Republic Peso`
  String get DominicanRepublicPeso {
    return Intl.message(
      'Dominican Republic Peso',
      name: 'DominicanRepublicPeso',
      desc: '',
      args: [],
    );
  }

  /// `East Caribbean Dollar`
  String get EastCaribbeanDollar {
    return Intl.message(
      'East Caribbean Dollar',
      name: 'EastCaribbeanDollar',
      desc: '',
      args: [],
    );
  }

  /// `Egypt Pound`
  String get EgyptPound {
    return Intl.message(
      'Egypt Pound',
      name: 'EgyptPound',
      desc: '',
      args: [],
    );
  }

  /// `El Salvador Colon`
  String get ElSalvadorColon {
    return Intl.message(
      'El Salvador Colon',
      name: 'ElSalvadorColon',
      desc: '',
      args: [],
    );
  }

  /// `Euro`
  String get EuroMemberCountries {
    return Intl.message(
      'Euro',
      name: 'EuroMemberCountries',
      desc: '',
      args: [],
    );
  }

  /// `Falkland Islands Malvinas Pound`
  String get FalklandIslandsMalvinasPound {
    return Intl.message(
      'Falkland Islands Malvinas Pound',
      name: 'FalklandIslandsMalvinasPound',
      desc: '',
      args: [],
    );
  }

  /// `Fiji Dollar`
  String get FijiDollar {
    return Intl.message(
      'Fiji Dollar',
      name: 'FijiDollar',
      desc: '',
      args: [],
    );
  }

  /// `Ghana Cedi`
  String get GhanaCedi {
    return Intl.message(
      'Ghana Cedi',
      name: 'GhanaCedi',
      desc: '',
      args: [],
    );
  }

  /// `Gibraltar Pound`
  String get GibraltarPound {
    return Intl.message(
      'Gibraltar Pound',
      name: 'GibraltarPound',
      desc: '',
      args: [],
    );
  }

  /// `Guatemala Quetzal`
  String get GuatemalaQuetzal {
    return Intl.message(
      'Guatemala Quetzal',
      name: 'GuatemalaQuetzal',
      desc: '',
      args: [],
    );
  }

  /// `Guernsey Pound`
  String get GuernseyPound {
    return Intl.message(
      'Guernsey Pound',
      name: 'GuernseyPound',
      desc: '',
      args: [],
    );
  }

  /// `Guyana Dollar`
  String get GuyanaDollar {
    return Intl.message(
      'Guyana Dollar',
      name: 'GuyanaDollar',
      desc: '',
      args: [],
    );
  }

  /// `Honduras Lempira`
  String get HondurasLempira {
    return Intl.message(
      'Honduras Lempira',
      name: 'HondurasLempira',
      desc: '',
      args: [],
    );
  }

  /// `Hong Kong Dollar`
  String get HongKongDollar {
    return Intl.message(
      'Hong Kong Dollar',
      name: 'HongKongDollar',
      desc: '',
      args: [],
    );
  }

  /// `Hungary Forint`
  String get HungaryForint {
    return Intl.message(
      'Hungary Forint',
      name: 'HungaryForint',
      desc: '',
      args: [],
    );
  }

  /// `Iceland Krona`
  String get IcelandKrona {
    return Intl.message(
      'Iceland Krona',
      name: 'IcelandKrona',
      desc: '',
      args: [],
    );
  }

  /// `India Rupee`
  String get IndiaRupee {
    return Intl.message(
      'India Rupee',
      name: 'IndiaRupee',
      desc: '',
      args: [],
    );
  }

  /// `Indonesia Rupiah`
  String get IndonesiaRupiah {
    return Intl.message(
      'Indonesia Rupiah',
      name: 'IndonesiaRupiah',
      desc: '',
      args: [],
    );
  }

  /// `Iran Rial`
  String get IranRial {
    return Intl.message(
      'Iran Rial',
      name: 'IranRial',
      desc: '',
      args: [],
    );
  }

  /// `Isle of Man Pound`
  String get IsleOfManPound {
    return Intl.message(
      'Isle of Man Pound',
      name: 'IsleOfManPound',
      desc: '',
      args: [],
    );
  }

  /// `Israel Shekel`
  String get IsraelShekel {
    return Intl.message(
      'Israel Shekel',
      name: 'IsraelShekel',
      desc: '',
      args: [],
    );
  }

  /// `Jamaica Dollar`
  String get JamaicaDollar {
    return Intl.message(
      'Jamaica Dollar',
      name: 'JamaicaDollar',
      desc: '',
      args: [],
    );
  }

  /// `Japan Yen`
  String get JapanYen {
    return Intl.message(
      'Japan Yen',
      name: 'JapanYen',
      desc: '',
      args: [],
    );
  }

  /// `Jersey Pound`
  String get JerseyPound {
    return Intl.message(
      'Jersey Pound',
      name: 'JerseyPound',
      desc: '',
      args: [],
    );
  }

  /// `Kazakhstan Tenge`
  String get KazakhstanTenge {
    return Intl.message(
      'Kazakhstan Tenge',
      name: 'KazakhstanTenge',
      desc: '',
      args: [],
    );
  }

  /// `Korea (North) Won`
  String get KoreaNorthWon {
    return Intl.message(
      'Korea (North) Won',
      name: 'KoreaNorthWon',
      desc: '',
      args: [],
    );
  }

  /// `Korea (South) Won`
  String get KoreaSouthWon {
    return Intl.message(
      'Korea (South) Won',
      name: 'KoreaSouthWon',
      desc: '',
      args: [],
    );
  }

  /// `Kyrgyzstan Som`
  String get KyrgyzstanSom {
    return Intl.message(
      'Kyrgyzstan Som',
      name: 'KyrgyzstanSom',
      desc: '',
      args: [],
    );
  }

  /// `Laos Kip`
  String get LaosKip {
    return Intl.message(
      'Laos Kip',
      name: 'LaosKip',
      desc: '',
      args: [],
    );
  }

  /// `Lebanon Pound`
  String get LebanonPound {
    return Intl.message(
      'Lebanon Pound',
      name: 'LebanonPound',
      desc: '',
      args: [],
    );
  }

  /// `Liberia Dollar`
  String get LiberiaDollar {
    return Intl.message(
      'Liberia Dollar',
      name: 'LiberiaDollar',
      desc: '',
      args: [],
    );
  }

  /// `Macedonia Denar`
  String get MacedoniaDenar {
    return Intl.message(
      'Macedonia Denar',
      name: 'MacedoniaDenar',
      desc: '',
      args: [],
    );
  }

  /// `Malaysia Ringgit`
  String get MalaysiaRinggit {
    return Intl.message(
      'Malaysia Ringgit',
      name: 'MalaysiaRinggit',
      desc: '',
      args: [],
    );
  }

  /// `Mauritius Rupee`
  String get MauritiusRupee {
    return Intl.message(
      'Mauritius Rupee',
      name: 'MauritiusRupee',
      desc: '',
      args: [],
    );
  }

  /// `Mexico Peso`
  String get MexicoPeso {
    return Intl.message(
      'Mexico Peso',
      name: 'MexicoPeso',
      desc: '',
      args: [],
    );
  }

  /// `Mongolia Tughrik`
  String get MongoliaTughrik {
    return Intl.message(
      'Mongolia Tughrik',
      name: 'MongoliaTughrik',
      desc: '',
      args: [],
    );
  }

  /// `Mozambique Metical`
  String get MozambiqueMetical {
    return Intl.message(
      'Mozambique Metical',
      name: 'MozambiqueMetical',
      desc: '',
      args: [],
    );
  }

  /// `Namibia Dollar`
  String get NamibiaDollar {
    return Intl.message(
      'Namibia Dollar',
      name: 'NamibiaDollar',
      desc: '',
      args: [],
    );
  }

  /// `Nepal Rupee`
  String get NepalRupee {
    return Intl.message(
      'Nepal Rupee',
      name: 'NepalRupee',
      desc: '',
      args: [],
    );
  }

  /// `Netherlands Antilles Guilder`
  String get NetherlandsAntillesGuilder {
    return Intl.message(
      'Netherlands Antilles Guilder',
      name: 'NetherlandsAntillesGuilder',
      desc: '',
      args: [],
    );
  }

  /// `New Zealand Dollar`
  String get NewZealandDollar {
    return Intl.message(
      'New Zealand Dollar',
      name: 'NewZealandDollar',
      desc: '',
      args: [],
    );
  }

  /// `Nicaragua Cordoba`
  String get NicaraguaCordoba {
    return Intl.message(
      'Nicaragua Cordoba',
      name: 'NicaraguaCordoba',
      desc: '',
      args: [],
    );
  }

  /// `Nigeria Naira`
  String get NigeriaNaira {
    return Intl.message(
      'Nigeria Naira',
      name: 'NigeriaNaira',
      desc: '',
      args: [],
    );
  }

  /// `Norway Krone`
  String get NorwayKrone {
    return Intl.message(
      'Norway Krone',
      name: 'NorwayKrone',
      desc: '',
      args: [],
    );
  }

  /// `Oman Rial`
  String get OmanRial {
    return Intl.message(
      'Oman Rial',
      name: 'OmanRial',
      desc: '',
      args: [],
    );
  }

  /// `Pakistan Rupee`
  String get PakistanRupee {
    return Intl.message(
      'Pakistan Rupee',
      name: 'PakistanRupee',
      desc: '',
      args: [],
    );
  }

  /// `Panama Balboa`
  String get PanamaBalboa {
    return Intl.message(
      'Panama Balboa',
      name: 'PanamaBalboa',
      desc: '',
      args: [],
    );
  }

  /// `Paraguay Guarani`
  String get ParaguayGuarani {
    return Intl.message(
      'Paraguay Guarani',
      name: 'ParaguayGuarani',
      desc: '',
      args: [],
    );
  }

  /// `Peru Sol`
  String get PeruSol {
    return Intl.message(
      'Peru Sol',
      name: 'PeruSol',
      desc: '',
      args: [],
    );
  }

  /// `Philippines Peso`
  String get PhilippinesPeso {
    return Intl.message(
      'Philippines Peso',
      name: 'PhilippinesPeso',
      desc: '',
      args: [],
    );
  }

  /// `Poland Zloty`
  String get PolandZloty {
    return Intl.message(
      'Poland Zloty',
      name: 'PolandZloty',
      desc: '',
      args: [],
    );
  }

  /// `Qatar Riyal`
  String get QatarRiyal {
    return Intl.message(
      'Qatar Riyal',
      name: 'QatarRiyal',
      desc: '',
      args: [],
    );
  }

  /// `Romania Leu`
  String get RomaniaLeu {
    return Intl.message(
      'Romania Leu',
      name: 'RomaniaLeu',
      desc: '',
      args: [],
    );
  }

  /// `Russia Ruble`
  String get RussiaRuble {
    return Intl.message(
      'Russia Ruble',
      name: 'RussiaRuble',
      desc: '',
      args: [],
    );
  }

  /// `Saint Helena Pound`
  String get SaintHelenaPound {
    return Intl.message(
      'Saint Helena Pound',
      name: 'SaintHelenaPound',
      desc: '',
      args: [],
    );
  }

  /// `Saudi Arabia Riyal`
  String get SaudiArabiaRiyal {
    return Intl.message(
      'Saudi Arabia Riyal',
      name: 'SaudiArabiaRiyal',
      desc: '',
      args: [],
    );
  }

  /// `Serbia Dinar`
  String get SerbiaDinar {
    return Intl.message(
      'Serbia Dinar',
      name: 'SerbiaDinar',
      desc: '',
      args: [],
    );
  }

  /// `Seychelles Rupee`
  String get SeychellesRupee {
    return Intl.message(
      'Seychelles Rupee',
      name: 'SeychellesRupee',
      desc: '',
      args: [],
    );
  }

  /// `Singapore Dollar`
  String get SingaporeDollar {
    return Intl.message(
      'Singapore Dollar',
      name: 'SingaporeDollar',
      desc: '',
      args: [],
    );
  }

  /// `Solomon Islands Dollar`
  String get SolomonIslandsDollar {
    return Intl.message(
      'Solomon Islands Dollar',
      name: 'SolomonIslandsDollar',
      desc: '',
      args: [],
    );
  }

  /// `Somalia Shilling`
  String get SomaliaShilling {
    return Intl.message(
      'Somalia Shilling',
      name: 'SomaliaShilling',
      desc: '',
      args: [],
    );
  }

  /// `South Africa Rand`
  String get SouthAfricaRand {
    return Intl.message(
      'South Africa Rand',
      name: 'SouthAfricaRand',
      desc: '',
      args: [],
    );
  }

  /// `Sri Lanka Rupee`
  String get SriLankaRupee {
    return Intl.message(
      'Sri Lanka Rupee',
      name: 'SriLankaRupee',
      desc: '',
      args: [],
    );
  }

  /// `Sweden Krona`
  String get SwedenKrona {
    return Intl.message(
      'Sweden Krona',
      name: 'SwedenKrona',
      desc: '',
      args: [],
    );
  }

  /// `Switzerland Franc`
  String get SwitzerlandFranc {
    return Intl.message(
      'Switzerland Franc',
      name: 'SwitzerlandFranc',
      desc: '',
      args: [],
    );
  }

  /// `Suriname Dollar`
  String get SurinameDollar {
    return Intl.message(
      'Suriname Dollar',
      name: 'SurinameDollar',
      desc: '',
      args: [],
    );
  }

  /// `Syria Pound`
  String get SyriaPound {
    return Intl.message(
      'Syria Pound',
      name: 'SyriaPound',
      desc: '',
      args: [],
    );
  }

  /// `Taiwan New Dollar`
  String get TaiwanNewDollar {
    return Intl.message(
      'Taiwan New Dollar',
      name: 'TaiwanNewDollar',
      desc: '',
      args: [],
    );
  }

  /// `Thailand Baht`
  String get ThailandBaht {
    return Intl.message(
      'Thailand Baht',
      name: 'ThailandBaht',
      desc: '',
      args: [],
    );
  }

  /// `Trinidad and Tobago Dollar`
  String get TrinidadAndTobagoDollar {
    return Intl.message(
      'Trinidad and Tobago Dollar',
      name: 'TrinidadAndTobagoDollar',
      desc: '',
      args: [],
    );
  }

  /// `Turkey Lira`
  String get TurkeyLira {
    return Intl.message(
      'Turkey Lira',
      name: 'TurkeyLira',
      desc: '',
      args: [],
    );
  }

  /// `Tuvalu Dollar`
  String get TuvaluDollar {
    return Intl.message(
      'Tuvalu Dollar',
      name: 'TuvaluDollar',
      desc: '',
      args: [],
    );
  }

  /// `Ukraine Hryvnia`
  String get UkraineHryvnia {
    return Intl.message(
      'Ukraine Hryvnia',
      name: 'UkraineHryvnia',
      desc: '',
      args: [],
    );
  }

  /// `United Kingdom Pound`
  String get UnitedKingdomPound {
    return Intl.message(
      'United Kingdom Pound',
      name: 'UnitedKingdomPound',
      desc: '',
      args: [],
    );
  }

  /// `United States Dollar`
  String get UnitedStatesDollar {
    return Intl.message(
      'United States Dollar',
      name: 'UnitedStatesDollar',
      desc: '',
      args: [],
    );
  }

  /// `Uruguay Peso`
  String get UruguayPeso {
    return Intl.message(
      'Uruguay Peso',
      name: 'UruguayPeso',
      desc: '',
      args: [],
    );
  }

  /// `Uzbekistan Som`
  String get UzbekistanSom {
    return Intl.message(
      'Uzbekistan Som',
      name: 'UzbekistanSom',
      desc: '',
      args: [],
    );
  }

  /// `Venezuela Bolivar`
  String get VenezuelaBolivar {
    return Intl.message(
      'Venezuela Bolivar',
      name: 'VenezuelaBolivar',
      desc: '',
      args: [],
    );
  }

  /// `Vietnam Dong`
  String get VietnamDong {
    return Intl.message(
      'Vietnam Dong',
      name: 'VietnamDong',
      desc: '',
      args: [],
    );
  }

  /// `Yemen Rial`
  String get YemenRial {
    return Intl.message(
      'Yemen Rial',
      name: 'YemenRial',
      desc: '',
      args: [],
    );
  }

  /// `Zimbabwe Dollar`
  String get ZimbabweDollar {
    return Intl.message(
      'Zimbabwe Dollar',
      name: 'ZimbabweDollar',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message(
      'None',
      name: 'none',
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

  /// `Jun`
  String get jun {
    return Intl.message(
      'Jun',
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
  String get dec {
    return Intl.message(
      'December',
      name: 'dec',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Add Amount in Account`
  String get addAmount {
    return Intl.message(
      'Add Amount in Account',
      name: 'addAmount',
      desc: '',
      args: [],
    );
  }

  /// `Edit Amount in Account`
  String get editAmount {
    return Intl.message(
      'Edit Amount in Account',
      name: 'editAmount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Amount`
  String get confirmAmount {
    return Intl.message(
      'Confirm Amount',
      name: 'confirmAmount',
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
