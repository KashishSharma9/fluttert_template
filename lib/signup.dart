import 'package:dolat_digital/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

  signup()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(Wrapper());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            Text('Get Started!', style: TextStyle( fontSize: 20),),
            SizedBox(height: 20,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'Enter email',
                fillColor: const Color(0xff8f9fA),
                filled: true,
                prefixIcon: const Icon(Icons.email_outlined),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(50)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
            SizedBox(height: 25,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Enter password',
                fillColor: const Color(0xff8f9fA),
                filled: true,
                prefixIcon: const Icon(Icons.key_rounded),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(50)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (()=> signup()), child: Text('SIGN UP'))
          ],
        ),
      ),
    );
  }
}
