import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      
      children: [
        Icon(FontAwesomeIcons.circle),
        SizedBox(width: 17,),
        Text("My Tasks",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
      ],
    );
  }
}