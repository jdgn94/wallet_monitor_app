import 'package:wallet_monitor/generated/l10n.dart';

String getCategory(String name) {
  switch (name) {
    case "shopping":
      return S.current.shopping;
    case "sale":
      return S.current.sale;
    case "change":
      return S.current.change;
    case "service":
      return S.current.service;
    case "payment":
      return S.current.payment;
    case "commission":
      return S.current.commission;
    case "food":
      return S.current.food;
    case "games":
      return S.current.games;
    case "entertainment":
      return S.current.entertainment;
    case "gas":
      return S.current.gas;
    case "parking":
      return S.current.parking;
    case "electronic":
      return S.current.electronic;
    case "homeCategory":
      return S.current.homeCategory;
    case "accessories":
      return S.current.accessories;
    case "present":
      return S.current.present;
    case "loan":
      return S.current.loan;
    case "pay":
      return S.current.pay;
    case "car":
      return S.current.car;
    case "cleaning":
      return S.current.cleaning;
    default:
      return 'None';
  }
}
