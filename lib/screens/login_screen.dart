import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'forgatepass_screen.dart';
import '/screens/signup_screen.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../arogyascreens/main_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign-in function
  Future<void> _signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Show error if email or password is empty
      Get.snackbar("Error", "Please enter both email and password");
      return;
    }

    try {
      // Attempt to sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Successfully signed in, navigate to main page
      if (userCredential.user != null) { // Get the authenticated user
        Get.to(() => MainPage()); // Pass userId as a named argument
      }
    } catch (e) {
      // Handle errors (e.g., incorrect email or password)
      Get.snackbar("Error", "Invalid credentials. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 145, 218, 252),
              Color.fromARGB(255, 193, 233, 251),
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 166, 217, 240),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.login,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sign in with email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              textAlign: TextAlign.center,
              "Or provide username and password",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 153, 161, 83),
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20, width: 50),
            CustomTextfield(
              prefixIcon: const Icon(
                Icons.email,
                color: Color.fromARGB(255, 153, 161, 83),
                size: 20,
              ),
              controller: _emailController,
              hintText: "Email",
              obsecureText: false,
              width: 350,
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              prefixIcon: const Icon(
                Icons.lock,
                color: Color.fromARGB(255, 153, 161, 83),
                size: 20,
              ),
              controller: _passwordController,
              hintText: "Password",
              obsecureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  size: 20,
                  color: Color.fromARGB(255, 239, 86, 86),
                ),
              ),
              width: 350,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgetPassScreen());
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonText: "Log in",
              onPressed: _signIn,
            ),
            const SizedBox(height: 15),
            CustomButton2(
              buttonText: "Create an Account",
              onPressed: () {
                Get.to(() => const SignupScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
