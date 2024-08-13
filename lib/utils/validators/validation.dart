class TValidator {
  /// Empty Text Validation
  static String? validEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'A $fieldName mező nem lehet üres';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Az E-mail mező nem lehet üres.';
    }

    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Nem helyes az Email formátuma.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'A jelszó mező nem lehet üres.';
    }

    if (value.length < 6) {
      return 'A jelszónak legalább 6 karakter hosszúnek kell lennie';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'A jelszónak tartalmaznia kell legalább egy nagybetűt';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'A jelszónak tartalmaznia kell legalább egy számot';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'A jelszónak tartalmaznia kell legalább egy speciális karaktert';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'A telefonszám mező nem lehet üres';
    }

    final phoneRegExp = RegExp(r'^(?:\+36|06)?\s?(\d{1,2})\s?\d{3}\s?\d{4}$');


    if (!phoneRegExp.hasMatch(value)) {
      return 'Nem helyes a szám formátuma';
    }

    return null;
  }
}