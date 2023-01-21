import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_app/ana_sayfa.dart';
import 'package:student_app/utilities/google_sign_in.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: const SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  bool isFirebaseInitialized = false;

@override
  void initState() {
    super.initState();
    initializeFirebase();
  }
   
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
    if (FirebaseAuth.instance.currentUser != null) {
      anaSayfayaGit();
    }

    //anaSayfayaGit();
  }

  void anaSayfayaGit() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
      builder:(context) => const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isFirebaseInitialized ? ElevatedButton(onPressed: () async {
          await signInWithGoogle();
          anaSayfayaGit();
        }, child: const Text("Google Sign in")): const CircularProgressIndicator(),
    ),
    );
  }
 
}

