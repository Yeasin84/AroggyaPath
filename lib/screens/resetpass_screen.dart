import '/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_button.dart';

class ResetpassScreen extends StatelessWidget {
  const ResetpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
                    height: 25,
                  ),
            Text("Enter your New Password",
            style: Theme.of(context).textTheme.headlineMedium
            ),
            const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        hintText: "New Password", 
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility_off)
                        ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        hintText: "Re-Enter New Password", 
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility_off)
                        ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton2(
                      buttonText: "Confirm",
                      onPressed: ()=>{Get.to(() => const LoginScreen())},
                    ),
                  ),
          ],

        ),
        ),
      ),
    );
  }
}