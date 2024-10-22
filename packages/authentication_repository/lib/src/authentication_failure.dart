part of 'authentication_repository.dart';

class AuthenticationFailure implements Exception {
  const AuthenticationFailure([this.message = 'An unknown error occurred.']);

  final String message;

  factory AuthenticationFailure.fromCode(int code) {
    switch (code) {
      case 401:
        return const AuthenticationFailure('Unauthorized');
      case 422:
        return const AuthenticationFailure('Invalid credentials');
      default:
        return const AuthenticationFailure();
    }
  }

  @override
  String toString() => 'Login error: $message';
}
