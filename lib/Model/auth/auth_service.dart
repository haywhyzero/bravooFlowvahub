
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {

  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final SupabaseClient _client = Supabase.instance.client;

  // Email/Password Sign Up
  Future<User?> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? userMetadata,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: userMetadata,
    );
    return response.user;
  }

  // Email/Password Sign In
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response.user;
  }

  // OAuth Sign In
  Future<void> signInWithOAuth(OAuthProvider provider) async {
    await _client.auth.signInWithOAuth(
      provider,
      redirectTo: 'io.supabase.com.ayomide.bravoo://login-callback/',
    );
  }

  Future<void> signInWithGoogleOAuth() => signInWithOAuth(OAuthProvider.google);
  Future<void> signInWithAppleOAuth() => signInWithOAuth(OAuthProvider.apple);



  // Helpers
  User? get currentUser => _client.auth.currentUser;
  Session? get currentSession => _client.auth.currentSession;
  Stream<AuthState> get onAuthStateChange => _client.auth.onAuthStateChange;

  // Password reset
  Future<void> resetPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }
}