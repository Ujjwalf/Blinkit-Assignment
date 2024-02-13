import 'package:blinkit_assignment/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.07,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Enter details to login",
              style: TextStyle(
                height: height * 0.001,
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            Container(
              width: width * 0.8,
              height: height * 0.06,
              child: TextField(
                //emailfield
                decoration: InputDecoration(
                  label: const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                controller: _emailController,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width * 0.8,
              height: height * 0.06,
              child: TextField(
                //emailfield
                obscureText: true,
                decoration: InputDecoration(
                  label: const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                controller: _passwordController,
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            ElevatedButton(
              onPressed: () {
                logIn();
              },
              child: const Text(
                "Login",
              ),
            ),
            SizedBox(
              height: height * 0.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New Here?",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
