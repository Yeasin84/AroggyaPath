import '/components/custom_button.dart';
import '/screens/login_screen.dart';
import '/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(Icons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text("Verify Email address!",
                  style: Theme.of(context).textTheme.headlineMedium),
              //image
              Image.asset('assets/images/emailVerify.png'),
              const SizedBox(
                height: 35,
              ),
              
              const Text(
                  "Congratulations! Your Account Awaits; Verify your Email to Confirm",
                  textAlign: TextAlign.center,),
              SizedBox(
                width: double.infinity,
                child: CustomButton2(buttonText: "Continue", onPressed: () => {Get.to(const SuccessScreen())}),
              ),
              const SizedBox(height:5,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text("Resend Email")),)

              //title & SubTitle

              //Button
            ],
          ),
        ),
      ),
    );
  }
}
