import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_app/main.dart';
import 'package:student_app/utilities/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(   
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(FirebaseAuth.instance.currentUser!.displayName!),
            ListTile(title: Text("Logout"), onTap: () async {
              await logOutWithGoogle();
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder:(context) => const SplashScreen(),
                ),
             );
            },
            )
          ],
        ),
      ),
    );
  }
}