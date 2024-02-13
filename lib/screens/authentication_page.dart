import 'package:blinkit_assignment/screens/user_home.dart';
import 'package:blinkit_assignment/screens/login_or_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return UserHomePage();
          else
            return LoginOrSignup();
        },
      ),
    );
  }
}
