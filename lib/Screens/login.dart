import 'dart:ui';

import 'package:bravoo/Model/auth/auth_service.dart';
import 'package:bravoo/Screens/reset.dart';
import 'package:bravoo/Screens/signup.dart';
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


  void _openmodaloverlay(BuildContext context){
  showModalBottomSheet(
    context: context, 
    isScrollControlled: true, 
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    showDragHandle: true,
    elevation: 3,
    builder: (context) => SignUpScreen(),
    ); 

}

  Future<void> _login() async {
    setState(() => _isLoading = true);

    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
          _showErrorSnackBar("Enter email and password!");
      return;
    }


      final response = await auth.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (response != null && mounted) {
        if (context.mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
        }
      } else {
        _showErrorSnackBar("Invalid login credentials!");
      }
    } catch (e) {
      String message = e.toString();
      if (message.contains('Network') || message.contains('XMLHttpRequest') || message.contains('SocketException')) {
        message = 'No internet connection!';
      } else if (message.contains('Invalid') || message.contains('credentials')) {
        message = 'Wrong email or password!';
      } else {
        message = "Login Failed: $message";
      }
      _showErrorSnackBar(message);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Helper

  void _showErrorSnackBar(String message) {
    if(context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red[500],));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withValues(alpha: 0.2),
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      "Continue to Log in",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Let's get you started.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 24),

                   _buildTextField(
                        controller: _emailController,
                        hint: 'Email address',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

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


                    const SizedBox(height: 24),

                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF4A4A4A),
                            Color(0xFF000000), 
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed:  _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
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
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              // forgot password
                              Navigator.of(context).pop();
                                showModalBottomSheet(
                                  context: context, 
                                  isScrollControlled: true, 
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  showDragHandle: true,
                                  elevation: 3,
                                  builder: (context) => ResetPassword(),
                                  ); 
                            },
                            child: const Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: Color(0xFF9013FE),
                        
                              ),
                              textAlign: TextAlign.right,
                            ),
                            
                          ),
                      ],
                    ),
                      const SizedBox(height: 25),

                    Row(
                        children: [
                          Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.4))),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.4),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.4))),
                        ],
                      ),

                      const SizedBox(height: 14,),

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

                    const SizedBox(height: 32),

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
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _openmodaloverlay(context);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xFF9013FE),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'By continuing you agree to the Rules and Policy.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black.withValues(alpha: 0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
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
        suffixIcon: suffixIcon,
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