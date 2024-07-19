import 'package:email/firebase_options.dart';
import 'package:email/screen/chat_page.dart';
import 'package:email/screen/login.dart';
import 'package:email/screen/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    routes: {
       LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        ChatPage.id:(context) => ChatPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
