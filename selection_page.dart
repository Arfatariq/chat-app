import 'package:chatapp/customWidgets/social_buttons.dart';
import 'package:chatapp/screens/login_page.dart';
import 'package:flutter/material.dart';

import 'signup_page.dart';



// ignore: camel_case_types
class selctionpage extends StatefulWidget {
  const selctionpage({super.key});

  @override
  State<selctionpage> createState() => _selctionpageState();
}

// ignore: camel_case_types
class _selctionpageState extends State<selctionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerLeft,
          ),
        ),
    
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                 
                    const Center(
                      child: Text(
                        'Chatbox',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 20),

                    
                    const Text(
                      'Connect',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        wordSpacing: 6,
                      ),
                    ),
                    const Text(
                      'friends',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        wordSpacing: 6,
                      ),
                    ),
                    const Text(
                      'easily &',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 8,
                      ),
                    ),
                    const Text(
                      'quickly',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 6,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Our chat app is the perfect way to stay connected',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        wordSpacing: 2,
                      ),
                    ),
                    const Text(
                      'with your friends and family easily.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        wordSpacing: 2,
                      ),
                    ),


                    const SizedBox(height: 25),
                 
                    Center(
                      child: SizedBox(
                        
                        width: 250,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          
                          SocialButtons(icon: Icons.g_mobiledata, onTap: () {}),
                        
                          SocialButtons(icon:Icons.facebook, onTap:(){}),
                          SocialButtons(icon:Icons.alternate_email, onTap:(){}),

                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

               
                    Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width: 140,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5,),
                        const Text('or',style: TextStyle(color: Colors.white, fontSize: 16,),),
                       const  SizedBox(width: 5,),
                        Container(
                             height: 1,
                          width: 140,
                          color: Colors.white,
                        ),
                      ],
                    ),

                     const SizedBox(height: 15),
                    
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => const SignupScreen()));
                        },
                        child: Container(
                          height: 40,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign up with Email',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                     const SizedBox(height: 15),
                    // Existing account text
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: const Center(
                        child: Text(
                          'Existing account? Login',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}
