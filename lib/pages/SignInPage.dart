// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:last_project/pages/HomePage.dart';
import 'package:last_project/pages/SignUpPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final supabase = Supabase.instance.client;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    Future<void> signIn() async {
      try {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Signing In...')));
        await supabase.auth.signInWithPassword(
          password: passwordController.text.trim(),
          email: emailController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 24, 24, 24)),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 160,
              ),
              Image.asset(
                'images/logo_book.png',
                color: const Color.fromARGB(255, 235, 235, 235),
                width: 60,
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                'Bookshelf Apps',
                style: TextStyle(color: Colors.white, fontFamily: 'Benzin'),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 35, 35, 35),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 156, 156, 156),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 60, 60, 60),
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 60, 60, 60),
                                  width: .2))),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      obscureText: passwordVisible,
                      controller: passwordController,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 35, 35, 35),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 156, 156, 156),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 60, 60, 60),
                                  width: 1)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 60, 60, 60),
                                  width: .2))),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: TextButton(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)))),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 35, 35, 35))),
                        onPressed: () {
                          signIn();
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ))),
              ),
              const SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not have an account?',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      style: const ButtonStyle(),
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
