// ignore_for_file: deprecated_member_use

import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:last_project/pages/HomePage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final supabase = Supabase.instance.client;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> signUp() async {
      try {
        await supabase.auth.signUp(
            password: passwordController.text.trim(),
            email: emailController.text.trim(),
            data: {'username': usernameController.text.trim()});
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } on AuthException catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 24, 24, 24)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
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
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 60, 60, 60),
                                width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    controller: usernameController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 35, 35, 35),
                        hintText: 'Username',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 60, 60, 60),
                                width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    controller: passwordController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 35, 35, 35),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 60, 60, 60),
                                width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                child: const SizedBox(
                  height: 50,
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 35, 35, 35),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 60, 60, 60),
                                width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                        signUp();
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ))),
            ),
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
