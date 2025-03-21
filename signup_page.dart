import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptTerms = false;

  // Validation Functions
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email address';
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) return 'This field is required';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    final passwordRegex = RegExp(r'^(?=.*[0-9])(?=.*[@#$%^&*]).{8,}$');
    if (!passwordRegex.hasMatch(value))
      return 'Must contain a digit & special character (@, #, \$, etc.)';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade400],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // **Logo (Home Button)**
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/'); // Navigate to WelcomePage
                    },
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please fill in this form to create an account!',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // **First Name**
                  TextFormField(
                    controller: _firstNameController,
                    decoration: _inputDecoration('First Name'),
                    style: const TextStyle(color: Colors.white),
                    validator: _validateName,
                  ),
                  const SizedBox(height: 15),

                  // **Last Name**
                  TextFormField(
                    controller: _lastNameController,
                    decoration: _inputDecoration('Last Name'),
                    style: const TextStyle(color: Colors.white),
                    validator: _validateName,
                  ),
                  const SizedBox(height: 15),

                  // **Email**
                  TextFormField(
                    controller: _emailController,
                    decoration: _inputDecoration('Email'),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 15),

                  // **Password**
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: _inputDecorationWithIcon(
                      'Password',
                      _obscurePassword
                          ? 'assets/images/eye_closed.png'
                          : 'assets/images/eye_open.png',
                      () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 15),

                  // **Confirm Password**
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: _inputDecorationWithIcon(
                      'Confirm Password',
                      _obscureConfirmPassword
                          ? 'assets/images/eye_closed.png'
                          : 'assets/images/eye_open.png',
                      () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: _validateConfirmPassword,
                  ),
                  const SizedBox(height: 15),

                  // **Terms & Conditions**
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: _acceptTerms,
                        onChanged: (bool? value) {
                          setState(() {
                            _acceptTerms = value!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'I accept the Terms of Use & Privacy Policy.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  // **Sign Up Button**
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Successful Validation
                        print(
                            "Sign-up successful with: ${_emailController.text}");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade800,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function for InputDecoration
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  // Helper function for InputDecoration with Icon (for password fields)
  InputDecoration _inputDecorationWithIcon(
      String label, String iconPath, VoidCallback onPressed) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      suffixIcon: IconButton(
        icon: Image.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        onPressed: onPressed,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
