import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/screens/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
   
  @override
  State<SignupScreen> createState()=> _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>{
  final TextEditingController _firstNameController =TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreeToTerms = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signUp function
  Future<void> _signUp() async{
    try {
      if(_agreeToTerms){
        //create a new user with email and password
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: _emailController.text.trim(),
         password: _passwordController.text.trim()
         );

         //Store user additional details in Firestore
         await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'username': _usernameController.text.trim(),
          'email': _emailController.text.trim(),
          'phone': _phoneController.text.trim(),
          'createdAt': Timestamp.now(),
         });

         //Navigate to the VerifyEmailScreen
         Get.to(() => const VerifyEmailScreen());
      } else{
        // Handle case where terms aren't agreed upon
        Get.snackbar("Error", "You must agree to the terms of use.");

      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                "Let's Create an Account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 55,
              ),

              //form
              Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _firstNameController,
                          expands: false,
                          decoration: const InputDecoration(
                              hintText: "First Name",
                              prefixIcon: Icon(Icons.person)),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _lastNameController,
                          expands: false,
                          decoration: const InputDecoration(
                              hintText: "Last Name",
                              prefixIcon: Icon(Icons.person)),
                        ),
                      )
                    ],
                  ),
                  //username
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    expands: false,
                    decoration: const InputDecoration(
                        hintText: "Username",
                        prefixIcon: Icon(Icons.account_circle_rounded)),
                  ),

                  //Email
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _emailController,
                    expands: false,
                    decoration: const InputDecoration(
                        hintText: "Email", 
                        prefixIcon: Icon(Icons.mail)
                        ),
                  ),
                  //Phone Number
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    expands: false,
                    decoration: const InputDecoration(
                        hintText: "Phone", prefixIcon: Icon(Icons.call)),
                  ),
                  //Password
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    expands: false,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility_off)),
                  ),
                  //checkbox
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: _agreeToTerms, 
                            onChanged: (value) {
                              setState(() {
                                _agreeToTerms = value!;
                              });
                            },
                          ),
                        ),
                      const Text("I agree to Privacy Policy and Terms of use"),
                    ],
                  ),
                  //signUp Button
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton2(
                      buttonText: "Create Account",
                      onPressed: _signUp,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
