// lib/screens/login_screen.dart
import 'package:bravoo/Model/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  final auth = AuthService();
  bool obscureText = true;



  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in both fields')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final user = await auth.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (user != null && mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      String message = e.toString();
      if (message.contains('Invalid login credentials')) {
        message = 'Wrong email or password';
      } else if (message.contains('Network')) {
        message = 'No internet connection';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const SizedBox(height: 70), 
                      const Text(
                        'Continue to log in',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          height: 1.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Let's get you started",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withValues(alpha: 0.9),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 20),

                      // Email Field
                      _buildTextField(
                        controller: _emailController,
                        hint: 'Email address',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      _buildTextField(
                        controller: _passwordController,
                        hint: 'Password',
                        obscureText: obscureText,
                        suffixIcon: IconButton(onPressed: (){
              setState(() {
                obscureText = !obscureText;
              });
            }, icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.black.withValues(alpha: 0.6),)),
                      ),
                      const SizedBox(height: 28),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : const Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () {
                          // forgot password functionality
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Color(0xFF9013FE),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // OR Divider
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.4))),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.8),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.4))),
                        ],
                      ),
                      const SizedBox(height: 28),

                      // Google Button
                      _socialButton(
                        onTap: () async {
                          setState(() => _isLoading = true);
                          await auth.signInWithGoogleOAuth();
                          if (mounted) setState(() => _isLoading = false);
                        },
                        icon: 'assets/images/google_logo.png',
                        text: 'Continue with Google',
                      ),
                      const SizedBox(height: 16),

                      // Apple Button
                      _socialButton(
                        onTap: () async {
                          setState(() => _isLoading = true);
                          await auth.signInWithAppleOAuth();
                          if (mounted) setState(() => _isLoading = false);
                        },
                        iconWidget: const Icon(Icons.apple, color: Color.fromARGB(255, 0, 0, 0), size: 30),
                        text: 'Continue with Apple',
                      ),

                      const SizedBox(height: 24),

                      // Sign up & Policy
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(color: Colors.black.withValues(alpha: 0.8)),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/signup'),
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Color(0xFF9013FE),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'By continuing you agree to the Rules and Policy.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withValues(alpha: 0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black.withValues(alpha: 0.6)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.black.withValues(alpha: 0.3), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        suffixIcon: suffixIcon != null
            ? suffixIcon
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
  }

  Widget _socialButton({
    required VoidCallback onTap,
    String? icon,
    Widget? iconWidget,
    required String text,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: _isLoading ? null : onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: 0.9),
          elevation: 3,
          side: BorderSide(color: Colors.black.withValues(alpha: 0.8), width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.all(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Image.asset(icon, height: 26, width: 26),
            if (iconWidget != null) iconWidget,
            const SizedBox(width: 14),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}