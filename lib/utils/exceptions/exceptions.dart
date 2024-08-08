/// Exception class for handling various errors.
class TExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const TExceptions([this.message = 'An unexpected error occurred. Please try again.']);

  /// Create an authentication exception from a Firebase authentication exception code.
  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Ez az email cím már használatban van.');
      case 'invalid-email':
        return const TExceptions('A megadott email nem érvényes.');
      case 'weak-password':
        return const TExceptions('A jelszó gyenge.');
      case 'user-disabled':
        return const TExceptions('This user account has been disabled. Please contact support for assistance.');
      case 'user-not-found':
        return const TExceptions('Nincs ilyen felhasználó regisztrálva.');
      case 'wrong-password':
        return const TExceptions('A megadott jelszó nem jó.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return const TExceptions('Hibás felhasználónév vagy jelszó.');
      case 'too-many-requests':
        return const TExceptions('Too many requests. Please try again later.');
      case 'invalid-argument':
        return const TExceptions('Invalid argument provided to the authentication method.');
      case 'invalid-password':
        return const TExceptions('A megadott jelszó nem érvényes');
      case 'invalid-phone-number':
        return const TExceptions('A megadott telefonszám nem érvényes.');
      case 'operation-not-allowed':
        return const TExceptions('The sign-in provider is disabled for your Firebase project.');
      case 'session-cookie-expired':
        return const TExceptions('The Firebase session cookie has expired. Please sign in again.');
      case 'uid-already-exists':
        return const TExceptions('The provided user ID is already in use by another user.');
      case 'sign_in_failed':
        return const TExceptions('Sign-in failed. Please try again.');
      case 'network-request-failed':
        return const TExceptions('Network request failed. Please check your internet connection.');
      case 'internal-error':
        return const TExceptions('Internal error. Please try again later.');
      case 'invalid-verification-code':
        return const TExceptions('Invalid verification code. Please enter a valid code.');
      case 'invalid-verification-id':
        return const TExceptions('Invalid verification ID. Please request a new verification code.');
      case 'quota-exceeded':
        return const TExceptions('Quota exceeded. Please try again later.');
      default:
        return const TExceptions();
    }
  }
}
