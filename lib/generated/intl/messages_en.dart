// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "dialogCancelTextBottom":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "dialogCancelTextBottomDefault":
            MessageLookupByLibrary.simpleMessage("Close"),
        "dialogConfirmTextBottomDefault":
            MessageLookupByLibrary.simpleMessage("Ok"),
        "dialogNoAccountText": MessageLookupByLibrary.simpleMessage(
            "To use application without account is not posible view data in web application."),
        "dialogNoAccountTitle":
            MessageLookupByLibrary.simpleMessage("Log in without account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailError":
            MessageLookupByLibrary.simpleMessage("The email is not valid."),
        "emailErrorInput":
            MessageLookupByLibrary.simpleMessage("The email is not valid."),
        "emailSuccess":
            MessageLookupByLibrary.simpleMessage("The email is valid."),
        "emailUsername":
            MessageLookupByLibrary.simpleMessage("Email or Username"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log in"),
        "logInError": MessageLookupByLibrary.simpleMessage(
            "Email/Username or password is not correct."),
        "logOut": MessageLookupByLibrary.simpleMessage("Log Out"),
        "noAccount":
            MessageLookupByLibrary.simpleMessage("Use without account"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordError":
            MessageLookupByLibrary.simpleMessage("The password is not valid."),
        "passwordErrorInput":
            MessageLookupByLibrary.simpleMessage("The password is not valid."),
        "passwordErrorRequirementLength": MessageLookupByLibrary.simpleMessage(
            "Characters length between 8 and 64."),
        "passwordErrorRequirementLower":
            MessageLookupByLibrary.simpleMessage("Lower letter required."),
        "passwordErrorRequirementNumber":
            MessageLookupByLibrary.simpleMessage("Number is required."),
        "passwordErrorRequirementSpecial": MessageLookupByLibrary.simpleMessage(
            "Special character required (\$@!%*?&#._-)."),
        "passwordErrorRequirementUpper":
            MessageLookupByLibrary.simpleMessage("Upper letter required."),
        "passwordSuccess":
            MessageLookupByLibrary.simpleMessage("The password is valid."),
        "passwordSuccessRequirementLength":
            MessageLookupByLibrary.simpleMessage(
                "Characters length are allowed."),
        "passwordSuccessRequirementLower":
            MessageLookupByLibrary.simpleMessage("Lower letter are allowed."),
        "passwordSuccessRequirementNumber":
            MessageLookupByLibrary.simpleMessage("Number are allowed."),
        "passwordSuccessRequirementSpecial":
            MessageLookupByLibrary.simpleMessage(
                "Special character are allowed."),
        "passwordSuccessRequirementUpper":
            MessageLookupByLibrary.simpleMessage("Upper letter are allowed."),
        "requirements": MessageLookupByLibrary.simpleMessage("Requirements"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usernameError": MessageLookupByLibrary.simpleMessage(
            "The username is not valid, character accepted (a-z 0-9 . _ -)."),
        "usernameErrorInput":
            MessageLookupByLibrary.simpleMessage("The username is not valid."),
        "usernameSuccess":
            MessageLookupByLibrary.simpleMessage("The username is valid.")
      };
}
