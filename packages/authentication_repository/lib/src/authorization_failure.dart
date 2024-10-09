part of 'authentication_repository.dart';

class AuthorizationFailure implements Exception {
  const AuthorizationFailure([this.message = 'An unknown error occurred.']);

  final String message;

  factory AuthorizationFailure.fromCode(int code) {
    switch (code) {
      case 401:
        return const AuthorizationFailure('Unauthorized');
      case 403:
        return const AuthorizationFailure('Forbidden');
      case 422:
        return const AuthorizationFailure('Invalid credentials');
      default:
        return const AuthorizationFailure();
    }
  }

  @override
  String toString() => 'Login error: $message';
}
