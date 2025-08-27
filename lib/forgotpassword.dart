import 'package:dolat_digital/wrapper.dart' show Wrapper;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

  reset()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    borderRadius: BorderRadius.circular(10)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),

            ElevatedButton(onPressed: (()=> reset()), child: Text('Send link'))
          ],
        ),
      ),
    );
  }
}
