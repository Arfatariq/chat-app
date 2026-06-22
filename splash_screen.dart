
import 'dart:async';
import 'package:chatapp/screens/selection_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const selctionpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline_outlined,color:Color.fromARGB(255, 43, 41, 41),size: 60,),
           

            const SizedBox(height: 20),

            // App name
            const Text(
              'CONVO',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 54, 55, 55),
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),

            // Tagline
            const Text(
              "Making communication effortless",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(179, 30, 31, 31),
              ),
            ),

            const SizedBox(height: 30),

            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),

          ],
        ),
      ),
    );
  }
}
