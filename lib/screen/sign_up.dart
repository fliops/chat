import 'package:email/help/show_snack_bar.dart';
import 'package:email/screen/chat_page.dart';
import 'package:email/screen/login.dart';
import 'package:email/widgets/CustomButon.dart';
import 'package:email/widgets/castmar_text_field.dart';
//import 'package:email/widgets/castmar_text_field.dart';
//import 'package:email/widgets/castmar_text_field.dart';
//import 'package:email/widgets/castmar_text_field.dart';
import 'package:email/widgets/title_emil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? password;
  String? fullName;

  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 5), //bt5ml padding lkol page

          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 50), //طريق من طريق توسيط العنصر
                Image.asset(
                  'assets/logo.png',
                  height: 200,
                ),
                const Row(
                  children: [
                    Text(
                      ' Sign Up ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleEmail(
                        titleEmail: 'Full Name',
                      ),
                    ],
                  ),
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    fullName = data;
                  },
                  hintText: 'Full Name',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleEmail(
                        titleEmail: 'Email',
                      ),
                    ],
                  ),
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleEmail(
                        titleEmail: 'Password',
                      ),
                    ],
                  ),
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                CustomButon(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        Navigator.push(context, ChatPage.id as Route<Object?>);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-fullName') {
                          showSnackBar(context, 'fullName');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already exists');
                        } else if (ex.code == 'weak-password') {
                          showSnackBar(context, 'weak password');
                        }
                      } catch (ex) {
                        showSnackBar(context, 'there was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  text: 'Sign Up',
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'already have an account?',
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          ' Login ?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF247ABF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
