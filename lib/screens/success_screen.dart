import '/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Add space at the top
              const SizedBox(height: 50),
              // Headline text with padding and bold style
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  "Email Verification Successful!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              //image
              Image.asset('assets/images/Verified.gif'),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Congratulations! Your Account Has Been Created",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton2(
                    buttonText: "Proceed to Login",
                    onPressed: () => {Get.to(const LoginScreen())}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
