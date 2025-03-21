import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage
import 'signup_page.dart'; // Import the SignUpPage

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const MaterialColor customColor = MaterialColor(0xFF0A2134, {
      50: const Color.fromRGBO(10, 33, 52, .1),
      100: const Color.fromRGBO(10, 33, 52, .2),
      200: const Color.fromRGBO(10, 33, 52, .3),
      300: const Color.fromRGBO(10, 33, 52, .4),
      400: const Color.fromRGBO(10, 33, 52, .5),
      500: const Color.fromRGBO(10, 33, 52, .6),
      600: const Color.fromRGBO(10, 33, 52, .7),
      700: const Color.fromRGBO(10, 33, 52, .8),
      800: const Color.fromRGBO(10, 33, 52, .9),
      900: const Color.fromRGBO(10, 33, 52, 1),
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [customColor.shade800, customColor.shade400],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png', // Path to your image
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'STARTPRO',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Your One-Step Solution for Startup Success',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Sign Up Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: customColor.shade800,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  // Navigate to Login Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
