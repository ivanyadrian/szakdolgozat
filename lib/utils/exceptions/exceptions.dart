/// Exception class for handling various errors.
class TExceptions {
  final String message;

  const TExceptions([this.message = 'Váratlan hiba történt. Kérlek, próbáld újra.']);

  /// Create an authentication exception from a Firebase authentication exception code.
  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Az email cím már regisztrálva van. Kérlek, használj másik email címet.');
      case 'invalid-email':
        return const TExceptions('Az email cím érvénytelen. Kérlek, adj meg egy érvényes email címet.');
      case 'weak-password':
        return const TExceptions('A jelszó túl gyenge. Válassz erősebb jelszót.');
      case 'user-disabled':
        return const TExceptions('Ez a felhasználói fiók le van tiltva. Kérlek, vedd fel a kapcsolatot a támogatással.');
      case 'user-not-found':
        return const TExceptions('Érvénytelen bejelentkezési adatok. Felhasználó nem található.');
      case 'wrong-password':
        return const TExceptions('Helytelen jelszó. Kérlek, ellenőrizd a jelszót és próbáld újra.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return const TExceptions('Érvénytelen bejelentkezési adatok. Kérlek, ellenőrizd az információkat.');
      case 'too-many-requests':
        return const TExceptions('Túl sok kérés. Kérlek, próbáld újra később.');
      case 'invalid-argument':
        return const TExceptions('Érvénytelen argumentum a hitelesítési módszerhez.');
      case 'invalid-password':
        return const TExceptions('Helytelen jelszó. Kérlek, próbáld újra.');
      case 'invalid-phone-number':
        return const TExceptions('A megadott telefonszám érvénytelen.');
      case 'operation-not-allowed':
        return const TExceptions('A bejelentkezési szolgáltató le van tiltva a Firebase projektedben.');
      case 'session-cookie-expired':
        return const TExceptions('A Firebase munkamenet cookie lejárt. Kérlek, jelentkezz be újra.');
      case 'uid-already-exists':
        return const TExceptions('A megadott felhasználói azonosító már használatban van egy másik felhasználó által.');
      case 'sign_in_failed':
        return const TExceptions('A bejelentkezés meghiúsult. Kérlek, próbáld újra.');
      case 'network-request-failed':
        return const TExceptions('Hálózati kérés meghiúsult. Kérlek, ellenőrizd az internet kapcsolatot.');
      case 'internal-error':
        return const TExceptions('Belső hiba. Kérlek, próbáld újra később.');
      case 'invalid-verification-code':
        return const TExceptions('Érvénytelen ellenőrző kód. Kérlek, adj meg egy érvényes kódot.');
      case 'invalid-verification-id':
        return const TExceptions('Érvénytelen ellenőrzési azonosító. Kérlek, kérj új ellenőrző kódot.');
      case 'quota-exceeded':
        return const TExceptions('Túllépted a kvótát. Kérlek, próbáld újra később.');
      default:
        return const TExceptions('Váratlan hiba történt. Kérlek, próbáld újra.');
    }
  }
}
