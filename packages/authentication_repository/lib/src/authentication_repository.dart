import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(this.apiBaseUrl);

  final _controller = StreamController<AuthenticationStatus>();
  final String apiBaseUrl;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    await http.post(Uri.parse('${this.apiBaseUrl}/login'), body: {
      'email': email,
      'password': password,
    }).then((response) {
      if (response.statusCode != 200) {
        var error = jsonDecode(response.body)['errors'][0];
        _controller.addError(error);
        throw error['title'];
      } else {
        _controller.add(AuthenticationStatus.authenticated);
      }
    });
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
