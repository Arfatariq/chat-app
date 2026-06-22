

import 'package:chatapp/customWidgets/social_buttons.dart';
import 'package:flutter/material.dart';




class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  //clean up the controllers using dispose after use
  @override
  void dispose (){
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(
                  height: 60,
                  width: 450,
              
                  child: Center(
                    child: Text('Login to the chatbox',  style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          wordSpacing: 1,
                        ),),
                  ),

                )     
              ],
            ),
            const Text(
                      'Our chat app is the perfect way to stay connected',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        wordSpacing: 1,
                      ),
                    ),
                    const Text(
                      'with your friends and family easily.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        wordSpacing: 2,
                      ),
                    ), const SizedBox(height: 20),
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                           
                            child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children: [
                          
                             
                            SocialButtons(icon: Icons.g_translate_outlined, onTap:(() {})),
                            SocialButtons(icon: Icons.facebook_outlined, onTap:(() {})),
                            SocialButtons(icon: Icons.alternate_email_outlined, onTap:(() {}))
                            ],
                    ),
                          ),
                        ],
                      ),
                       Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         
                        Container(
                          height: 1,
                          width: 140,
                          color: Colors.white,
                        ),   const  SizedBox(width: 5),
                        const Text('or',style: TextStyle(color: Colors.white, fontSize: 16,),),
                       const  SizedBox(width: 5),
                        Container(
                             height: 1,
                          width: 140,
                          color: Colors.white,
                        ),
                      ],
                    ),
                           const SizedBox(height: 10),
                    SizedBox(
  height: 250,
  width: 460,
 
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Email TextField
     TextField(
  controller: emailcontroller,
  obscureText: true,
  decoration: const InputDecoration(
    labelText: 'Enter Email',
    labelStyle: TextStyle(
      color: Color.fromARGB(255, 21, 99, 75),
      fontSize: 13,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
),


      const SizedBox(height: 20), 

      // Password TextField
      TextField(
  controller: passwordcontroller,
  obscureText: true,
  decoration: const InputDecoration(
    labelText: 'Enter Password',
    labelStyle: TextStyle(
      color: Color.fromARGB(255, 21, 99, 75),
      fontSize: 13,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
),

    ],
  ),
), Center(
                      child: Container(
                        height: 40,
                        width: 260,
                        decoration: BoxDecoration(
                       color: const Color.fromARGB(255, 21, 99, 75),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign up with Email',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                     const SizedBox(height: 10,),
                    // Existing account text
                    const Center(
                      child: Text(
                        'Forgot password ?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 33, 33, 33),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],

          
        ),
      ),

    );
  }
}