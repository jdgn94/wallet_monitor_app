// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Correo"),
        "emailError":
            MessageLookupByLibrary.simpleMessage("Correo no es valido."),
        "emailErrorInput":
            MessageLookupByLibrary.simpleMessage("Correo no valido."),
        "emailSuccess": MessageLookupByLibrary.simpleMessage("Correo valido."),
        "emailUsername":
            MessageLookupByLibrary.simpleMessage("Correo o Nombre de usuario"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "logIn": MessageLookupByLibrary.simpleMessage("Ingresar"),
        "logInError": MessageLookupByLibrary.simpleMessage(
            "Correo/Nombre de usuario o contraseña no son correctos."),
        "logOut": MessageLookupByLibrary.simpleMessage("Cerrar Sesión"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "passwordError":
            MessageLookupByLibrary.simpleMessage("Contraseña no valida."),
        "passwordErrorInput":
            MessageLookupByLibrary.simpleMessage("Contraseña no valida."),
        "passwordErrorRequirementLength": MessageLookupByLibrary.simpleMessage(
            "Cantidad de caracteres entre 8 y 64."),
        "passwordErrorRequirementLower":
            MessageLookupByLibrary.simpleMessage("Letra mayúscula requerida."),
        "passwordErrorRequirementNumber":
            MessageLookupByLibrary.simpleMessage("Número requerido."),
        "passwordErrorRequirementSpecial": MessageLookupByLibrary.simpleMessage(
            "Carácter especial requerido (\$@!%*?&#._-)."),
        "passwordErrorRequirementUpper":
            MessageLookupByLibrary.simpleMessage("Letra minúscula requerida."),
        "passwordSuccess":
            MessageLookupByLibrary.simpleMessage("Contraseña valida."),
        "passwordSuccessRequirementLength":
            MessageLookupByLibrary.simpleMessage(
                "Cantidad de caracteres aceptados."),
        "passwordSuccessRequirementLower":
            MessageLookupByLibrary.simpleMessage("Letra mayúscula agregada."),
        "passwordSuccessRequirementNumber":
            MessageLookupByLibrary.simpleMessage("Número agregado."),
        "passwordSuccessRequirementSpecial":
            MessageLookupByLibrary.simpleMessage("Carácter especial agregado."),
        "passwordSuccessRequirementUpper":
            MessageLookupByLibrary.simpleMessage("Letra minúscula agregada."),
        "requirements": MessageLookupByLibrary.simpleMessage("Requerimientos"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrarse"),
        "username": MessageLookupByLibrary.simpleMessage("Nombre de usuario"),
        "usernameError": MessageLookupByLibrary.simpleMessage(
            "El nombre de usuario no es valido, caracteres validos (a-z 0-9 . _ -)."),
        "usernameErrorInput": MessageLookupByLibrary.simpleMessage(
            "El nombre de usuario no es valido."),
        "usernameSuccess":
            MessageLookupByLibrary.simpleMessage("Nombre de usuario valid.")
      };
}
