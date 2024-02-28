import 'package:wallet_monitor/src/storage/shared_preferences.storage.dart';

const String _baseUrl = "assets/icons";
const String _finance = "$_baseUrl/finance";

String getCustomIconUrl(String name, String category, {String? forceIconType}) {
  final pref = SettingsLocalStorage.configPref;
  String iconType = forceIconType ?? pref.getString('categoryIcon') ?? '';
  switch (category) {
    case 'finance':
      return "$_baseUrl/finance/$name$iconType.svg";
    case 'home':
      return "$_baseUrl/home/$name$iconType.svg";
    case 'entertainment':
      return "$_baseUrl/entertainment/$name$iconType.svg";
    case 'family':
      return "$_baseUrl/family/$name$iconType.svg";
    case 'food_and_drink':
      return "$_baseUrl/food_and_drink/$name$iconType.svg";
    case 'health':
      return "$_baseUrl/health/$name$iconType.svg";
    case 'nature':
      return "$_baseUrl/nature/$name$iconType.svg";
    case 'pastime':
      return "$_baseUrl/pastime/$name$iconType.svg";
    case 'personal_care':
      return "$_baseUrl/personal_care/$name$iconType.svg";
    case 'pets':
      return "$_baseUrl/pets/$name$iconType.svg";
    case 'service':
      return "$_baseUrl/service/$name$iconType.svg";
    case 'shopping':
      return "$_baseUrl/shopping/$name$iconType.svg";
    case 'sports':
      return "$_baseUrl/sports/$name$iconType.svg";
    case 'study_work':
      return "$_baseUrl/study_work/$name$iconType.svg";
    case 'technology':
      return "$_baseUrl/technology/$name$iconType.svg";
    case 'transport':
      return "$_baseUrl/transport/$name$iconType.svg";
    case 'travel':
      return "$_baseUrl/travel/$name$iconType.svg";
    case 'other':
      return "$_baseUrl/other/$name$iconType.svg";
    default:
      return "$_baseUrl/travel/zeppelin.svg";
  }
}
