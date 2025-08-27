import 'package:dolat_digital/forgotpassword.dart';
import 'package:dolat_digital/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

  signin()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
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
            Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            Text('Good to see you again!', style: TextStyle( fontSize: 20),),
            SizedBox(height: 40,),
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
            ),SizedBox(height: 25,),
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
            ),SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 30),
                  padding: EdgeInsets.zero,
                ),
                onPressed: (() => Get.to(Forgot())),
                child: Text('Forgot Password?', style: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(height:50),
            ElevatedButton(style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 35),
              padding: EdgeInsets.zero,
            ),onPressed: (() => signin()), child: Text('LOGIN', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height:80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('Dont have an acoount?'),
                SizedBox(width: 15,),
                ElevatedButton(onPressed: (()=>Get.to(Signup())), child: Text('Register Now')),

              ],
            )
          ],
        ),
      ),
    );
  }
}
