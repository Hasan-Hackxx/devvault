import 'package:supabase_flutter/supabase_flutter.dart';

class InvalidCredentialException implements Exception {}

class InvalidEmailException implements Exception {}

// signup Exceptions

class EmailAlreadyInuseException implements Exception {}

class WeakPasswordException implements Exception {}

//Generial Exception

class GerneralException implements Exception {}

//  log out

class CouldntLogoutException implements Exception {}

class AuthService {
  Future<AuthResponse> login(String email, String password) async {
    try {
      final authresponse = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);

      return authresponse;
    } on AuthException catch (e) {
      final message = e.message.toLowerCase();
      print("message: $message");
      if (message.contains("invalid login credential")) {
        throw InvalidCredentialException();
      } else if (message.contains("email")) {
        throw InvalidEmailException();
      } else {
        throw GerneralException();
      }
    }
  }

  Future<AuthResponse> signup(String email, String password) async {
    try {
      final authresponse = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      return authresponse;
    } on AuthException catch (e) {
      final message = e.message.toLowerCase();
      print("message: $message");

      if (message.contains("already registered") ||
          message.contains("registered")) {
        throw EmailAlreadyInuseException();
      } else if (message.contains("weak password")) {
        throw WeakPasswordException();
      } else if (message.contains("email")) {
        throw InvalidEmailException();
      } else {
        throw GerneralException();
      }
    }
  }

  Future<void> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
    } catch (e) {
      throw CouldntLogoutException();
    }
  }
}
