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
      return 'Adj meg egy telefonszámot';
    }

    final phoneRegExp = RegExp(r'^(?:\+36|06)?\s?(\d{1,2})\s?\d{3}\s?\d{4}$');


    if (!phoneRegExp.hasMatch(value)) {
      return 'Nem helyes a szám formátuma';
    }

    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Add meg a horgászállások számát';
    }

    final numericRegExp = RegExp(r'^[0-9]+$');

    if (!numericRegExp.hasMatch(value)) {
      return 'Csak számok engedélyezettek.';
    }

    return null;
  }

  static String? validateGpsCoordinate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Add meg a hely GPS koordinátáját';
    }

    final gpsRegExp = RegExp(r'^-?([1-8]?\d(\.\d+)?|90(\.0+)?),\s?-?(1[0-7]\d(\.\d+)?|180(\.0+)?|([1-9]?\d(\.\d+)?))$');


    if (!gpsRegExp.hasMatch(value)) {
      return 'Nem helyes a GPS koordináta formátuma. (Helyes formátum pl.: 00.000000, 00.000000)';
    }

    return null;
  }

}