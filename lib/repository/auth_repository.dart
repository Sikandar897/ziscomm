// auth_repository.dart

import 'package:http/http.dart' as http;

class AuthRepository {
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email': email,
          'password': password,
        },
      );

      // Login successful
      if (response.statusCode == 200) {
        return true;
      } else {
        // Login failed
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception during login: $e');
      return false;
    }
  }
}
