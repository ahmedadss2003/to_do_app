import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
   const CustomIconButton({super.key, required this.icon, this.onPressed});
  final IconData icon ;
  final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 40,
        onPressed: onPressed,
        icon: Icon(
          icon ,
          color: Colors.black,
         ),
      ),
    );
  }
}