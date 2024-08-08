/// Custom exception class to handle various Firebase-related errors.
class TFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  TFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'Ismeretlen Firebase hiba történt. Kérlek, próbáld újra.';
      case 'invalid-custom-token':
        return 'A saját token formátuma helytelen. Ellenőrizd a saját tokened.';
      case 'custom-token-mismatch':
        return 'A saját token más célra vonatkozik.';
      case 'user-disabled':
        return 'A felhasználói fiók le van tiltva.';
      case 'user-not-found':
        return 'Nincs felhasználó a megadott email cím vagy UID alapján.';
      case 'invalid-email':
        return 'Az email cím érvénytelen. Kérlek, adj meg egy érvényes email címet.';
      case 'email-already-in-use':
        return 'Az email cím már regisztrálva van. Kérlek, használj másik email címet.';
      case 'wrong-password':
        return 'Helytelen jelszó. Ellenőrizd a jelszót és próbáld újra.';
      case 'weak-password':
        return 'A jelszó túl gyenge. Válassz erősebb jelszót.';
      case 'provider-already-linked':
        return 'A fiók már összekapcsolva van egy másik szolgáltatóval.';
      case 'operation-not-allowed':
        return 'Ez a művelet nem engedélyezett. Vedd fel a kapcsolatot a támogatással.';
      case 'invalid-credential':
        return 'A megadott hitelesítő adat hibás vagy lejárt.';
      case 'invalid-verification-code':
        return 'Érvénytelen ellenőrző kód. Kérlek, adj meg egy érvényes kódot.';
      case 'invalid-verification-id':
        return 'Érvénytelen ellenőrzési azonosító. Kérj új ellenőrző kódot.';
      case 'captcha-check-failed':
        return 'A reCAPTCHA válasz érvénytelen. Kérlek, próbáld újra.';
      case 'app-not-authorized':
        return 'Az alkalmazás nem jogosult a Firebase Authentication használatára a megadott API kulccsal.';
      case 'keychain-error':
        return 'Keychain hiba történt. Kérlek, ellenőrizd a keychain-t és próbáld újra.';
      case 'internal-error':
        return 'Belső hitelesítési hiba történt. Kérlek, próbáld újra később.';
      case 'invalid-app-credential':
        return 'Az alkalmazás hitelesítő adat érvénytelen. Kérlek, adj meg érvényes alkalmazás hitelesítő adatot.';
      case 'user-mismatch':
        return 'A megadott hitelesítő adatok nem egyeznek meg a korábban bejelentkezett felhasználóval.';
      case 'requires-recent-login':
        return 'Ez a művelet érzékeny és új bejelentkezést igényel. Kérlek, jelentkezz be újra.';
      case 'quota-exceeded':
        return 'Túllépted a kvótát. Kérlek, próbáld újra később.';
      case 'account-exists-with-different-credential':
        return 'Már létezik fiók ugyanazzal az email címmel, de eltérő bejelentkezési hitelesítő adatokkal.';
      case 'missing-iframe-start':
        return 'Az email sablon hiányolja az iframe start tag-et.';
      case 'missing-iframe-end':
        return 'Az email sablon hiányolja az iframe end tag-et.';
      case 'missing-iframe-src':
        return 'Az email sablon hiányolja az iframe src attribútumot.';
      case 'auth-domain-config-required':
        return 'Az authDomain konfiguráció szükséges az akció kód ellenőrzési linkhez.';
      case 'missing-app-credential':
        return 'Az alkalmazás hitelesítő adat hiányzik. Kérlek, adj meg érvényes alkalmazás hitelesítő adatokat.';
      case 'session-cookie-expired':
        return 'A Firebase munkamenet cookie lejárt. Kérlek, jelentkezz be újra.';
      case 'uid-already-exists':
        return 'A megadott felhasználói azonosító már használatban van egy másik felhasználó által.';
      case 'web-storage-unsupported':
        return 'A web tárolás nem támogatott vagy le van tiltva.';
      case 'app-deleted':
        return 'Ez a FirebaseApp példány törölve lett.';
      case 'user-token-mismatch':
        return 'A megadott felhasználó tokenje nem egyezik az authentikált felhasználó ID-jával.';
      case 'invalid-message-payload':
        return 'Az email sablon ellenőrző üzenet payload érvénytelen.';
      case 'invalid-sender':
        return 'Az email sablon feladó érvénytelen. Kérlek, ellenőrizd a feladó email címét.';
      case 'invalid-recipient-email':
        return 'A címzett email cím érvénytelen. Kérlek, adj meg érvényes címzett email címet.';
      case 'missing-action-code':
        return 'Az akció kód hiányzik. Kérlek, adj meg érvényes akció kódot.';
      case 'user-token-expired':
        return 'A felhasználó tokenje lejárt, és hitelesítés szükséges. Kérlek, jelentkezz be újra.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Érvénytelen bejelentkezési hitelesítő adatok.';
      case 'expired-action-code':
        return 'Az akció kód lejárt. Kérlek, kérj új akció kódot.';
      case 'invalid-action-code':
        return 'Az akció kód érvénytelen. Kérlek, ellenőrizd a kódot és próbáld újra.';
      case 'credential-already-in-use':
        return 'Ez a hitelesítő adat már egy másik felhasználói fiókhoz van társítva.';
      default:
        return 'Váratlan Firebase hiba történt. Kérlek, próbáld újra.';
    }
  }
}
