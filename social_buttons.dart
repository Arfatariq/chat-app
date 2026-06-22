import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget{
 final IconData icon;
 final VoidCallback onTap;

  const SocialButtons({
    super.key,
    required this.icon,
    required this.onTap,
  }

  );
   

@override
Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color.fromARGB(255, 26, 26, 26)),
        
          
        ),
        child: Icon(
          icon,
          color: Color.fromARGB(255, 14, 13, 13),
        ),
      ),
    
    );
  }



}