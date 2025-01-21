import '/screens/resetpass_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_button.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text("Enter Your Email address!",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        hintText: "Email", prefixIcon: Icon(Icons.mail)),
                  ),
              SizedBox(
                    width: double.infinity,
                    child: CustomButton2(
                      buttonText: "Send Mail",
                      onPressed: ()=>{Get.to(() => const ResetpassScreen())},
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}