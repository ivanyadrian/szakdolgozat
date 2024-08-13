/// Egyedi kivétel osztály, amely különféle Firebase hitelesítési hibákat kezel.
class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'Az e-mail cím már regisztrálva van. Kérlek, használj másik e-mail címet.';
      case 'invalid-email':
        return 'A megadott e-mail cím érvénytelen. Kérlek, adj meg egy érvényes e-mail címet.';
      case 'weak-password':
        return 'A jelszó túl gyenge. Kérlek, válassz egy erősebb jelszót.';
      case 'user-disabled':
        return 'Ez a felhasználói fiók le van tiltva. Kérlek, lépj kapcsolatba a támogatással.';
      case 'user-not-found':
        return 'Érvénytelen bejelentkezési adatok. Felhasználó nem található.';
      case 'wrong-password':
        return 'Helytelen jelszó. Kérlek, ellenőrizd a jelszót és próbálkozz újra.';
      case 'invalid-verification-code':
        return 'Érvénytelen ellenőrző kód. Kérlek, adj meg egy érvényes kódot.';
      case 'invalid-verification-id':
        return 'Érvénytelen ellenőrző azonosító. Kérlek, kérj új ellenőrző kódot.';
      case 'quota-exceeded':
        return 'A kvóta túllépve. Kérlek, próbáld később.';
      case 'email-already-exists':
        return 'Az e-mail cím már létezik. Kérlek, használj másik e-mail címet.';
      case 'provider-already-linked':
        return 'A fiók már össze van kapcsolva egy másik szolgáltatóval.';
      case 'requires-recent-login':
        return 'Ez a művelet érzékeny, és friss hitelesítést igényel. Kérlek, jelentkezz be újra.';
      case 'credential-already-in-use':
        return 'Ez a hitelesítő adat már másik felhasználói fiókhoz van társítva.';
      case 'user-mismatch':
        return 'A megadott hitelesítő adatok nem egyeznek a korábban bejelentkezett felhasználóval.';
      case 'account-exists-with-different-credential':
        return 'A megadott e-mail címhez már létezik fiók más bejelentkezési adatokkal.';
      case 'operation-not-allowed':
        return 'Ez a művelet nem engedélyezett. Kérlek, lépj kapcsolatba a támogatással.';
      case 'expired-action-code':
        return 'A műveleti kód lejárt. Kérlek, kérj új műveleti kódot.';
      case 'invalid-action-code':
        return 'A műveleti kód érvénytelen. Kérlek, ellenőrizd a kódot és próbálkozz újra.';
      case 'missing-action-code':
        return 'A műveleti kód hiányzik. Kérlek, adj meg egy érvényes műveleti kódot.';
      case 'user-token-expired':
        return 'A felhasználói token lejárt, és új hitelesítés szükséges. Kérlek, jelentkezz be újra.';
      case 'invalid-credential':
        return 'A megadott hitelesítő adat érvénytelen vagy lejárt.';
      case 'user-token-revoked':
        return 'A felhasználói token visszavonásra került. Kérlek, jelentkezz be újra.';
      case 'invalid-message-payload':
        return 'Az e-mail sablon ellenőrző üzenet adatainak terjedelme érvénytelen.';
      case 'invalid-sender':
        return 'Az e-mail sablon feladója érvénytelen. Kérlek, ellenőrizd a feladó e-mail címét.';
      case 'invalid-recipient-email':
        return 'A címzett e-mail cím érvénytelen. Kérlek, adj meg egy érvényes címzett e-mail címet.';
      case 'missing-iframe-start':
        return 'Az e-mail sablon hiányzik az iframe kezdő tag.';
      case 'missing-iframe-end':
        return 'Az e-mail sablon hiányzik az iframe befejező tag.';
      case 'missing-iframe-src':
        return 'Az e-mail sablon hiányzik az iframe src attribútum.';
      case 'auth-domain-config-required':
        return 'Az authDomain konfiguráció szükséges az akció kód ellenőrző linkhez.';
      case 'missing-app-credential':
        return 'Az alkalmazás hitelesítő adat hiányzik. Kérlek, adj meg érvényes alkalmazás hitelesítő adatokat.';
      case 'invalid-app-credential':
        return 'Az alkalmazás hitelesítő adat érvénytelen. Kérlek, adj meg érvényes alkalmazás hitelesítő adatokat.';
      case 'session-cookie-expired':
        return 'A Firebase munkamenet cookie lejárt. Kérlek, jelentkezz be újra.';
      case 'uid-already-exists':
        return 'A megadott felhasználói ID már egy másik felhasználó által használatban van.';
      case 'invalid-cordova-configuration':
        return 'A megadott Cordova konfiguráció érvénytelen.';
      case 'app-deleted':
        return 'Ez a FirebaseApp példány törölve lett.';
      case 'web-storage-unsupported':
        return 'A web tárolás nem támogatott vagy le van tiltva.';
      case 'app-not-authorized':
        return 'Az alkalmazás nem jogosult a Firebase Authentication használatára a megadott API kulccsal.';
      case 'keychain-error':
        return 'Keychain hiba történt. Kérlek, ellenőrizd a keychain-t és próbálkozz újra.';
      case 'internal-error':
        return 'Belső hitelesítési hiba történt. Kérlek, próbáld újra később.';
      default:
        return 'Váratlan hitelesítési hiba történt. Kérlek, próbáld újra.';
    }
  }
}
