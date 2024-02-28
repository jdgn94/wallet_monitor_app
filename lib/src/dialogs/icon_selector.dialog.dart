import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/helper/constants/icons/entertainment.icons.dart';
import 'package:wallet_monitor/src/helper/constants/icons/family.icons.dart';
import 'package:wallet_monitor/src/helper/constants/icons/finance.icons.dart';
import 'package:wallet_monitor/src/helper/constants/icons/food_and_drink.icons.dart';
import 'package:wallet_monitor/src/helper/constants/icons/home.icons.dart';
import 'package:wallet_monitor/src/helper/styles.helper.dart';
import 'package:wallet_monitor/src/settings/app_size.settings.dart';
import 'package:wallet_monitor/src/widgets/custom_icon.widget.dart';

showDialogIconSelector(
  BuildContext context,
  Function(String, String) changeIcon,
  String defaultIcon,
  String defaultCategory,
) {
  String iconSelected = defaultIcon;
  String categorySelected = defaultCategory;

  List<String> finance = financeList;
  List<String> home = homeList;
  List<String> entertainment = entertainmentList;
  List<String> foodAndDrink = foodAndDrinkList;
  List<String> family = familyList;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        List<CategoryIcon> financeIcons =
            categoryIconFromStringList(finance, 'finance');
        List<CategoryIcon> homeIcons = categoryIconFromStringList(home, 'home');
        List<CategoryIcon> entertainmentIcons =
            categoryIconFromStringList(entertainment, 'entertainment');
        List<CategoryIcon> foodAndDrinkIcons =
            categoryIconFromStringList(foodAndDrink, 'food_and_drink');
        List<CategoryIcon> familyIcons =
            categoryIconFromStringList(family, 'family');

        void _selectIcon(String name, String type) {
          setState(() {
            iconSelected = name;
            categorySelected = type;
          });
        }

        return AlertDialog(
          content: Material(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _subtitleCategory(
                    context,
                    S.current.finance,
                    showTopDivider: false,
                  ),
                  _iconCategory(
                    context,
                    financeIcons,
                    'finance',
                    iconSelected,
                    'finance' == categorySelected,
                    _selectIcon,
                  ),
                  _subtitleCategory(context, S.current.home),
                  _iconCategory(
                    context,
                    homeIcons,
                    'home',
                    iconSelected,
                    'home' == categorySelected,
                    _selectIcon,
                  ),
                  _subtitleCategory(context, S.current.entertainment),
                  _iconCategory(
                    context,
                    entertainmentIcons,
                    'entertainment',
                    iconSelected,
                    'entertainment' == categorySelected,
                    _selectIcon,
                  ),
                  _subtitleCategory(context, S.current.food_and_drink),
                  _iconCategory(
                    context,
                    foodAndDrinkIcons,
                    'food_and_drink',
                    iconSelected,
                    'food_and_drink' == categorySelected,
                    _selectIcon,
                  ),
                  _subtitleCategory(context, S.current.family),
                  _iconCategory(
                    context,
                    familyIcons,
                    'family',
                    iconSelected,
                    'family' == categorySelected,
                    _selectIcon,
                  ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}

Column _subtitleCategory(
  BuildContext context,
  String name, {
  bool showTopDivider = true,
}) {
  return Column(
    children: [
      if (showTopDivider)
        Divider(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
        ),
      Text(
        name,
        style: StylesHelper.textStyle().copyWith(
          fontSize: AppSizeSettings.fontSizeLarge,
        ),
      ),
      Divider(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
      ),
    ],
  );
}

Wrap _iconCategory(
  BuildContext context,
  List<CategoryIcon> icons,
  String iconType,
  String iconSelected,
  bool thisCategorySelected,
  Function(String, String) selectIcon,
) {
  return Wrap(
    children: icons
        .map((icon) => _iconButton(
              context,
              icon,
              iconType,
              iconSelected == icon.name && thisCategorySelected,
              selectIcon,
            ))
        .toList(),
  );
}

Padding _iconButton(
  BuildContext context,
  CategoryIcon icon,
  String iconType,
  bool active,
  Function(String, String) selectIcon,
) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: InkWell(
      onTap: () => selectIcon(icon.name, iconType),
      borderRadius: BorderRadius.circular(30.0),
      child: Ink(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: active
              ? Theme.of(context).colorScheme.primary.withOpacity(.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: CustomIconWidget(categoryIcon: icon, size: 33),
      ),
    ),
  );
}
