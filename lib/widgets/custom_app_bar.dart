import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onPressed, required this.leftIcon, required this.rightIcon});
  final IconData leftIcon;
  final IconData rightIcon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
     
      CustomIconButton(
          icon: leftIcon
        ) ,
        const Spacer(),
        CustomIconButton(
          icon: rightIcon
        
        ) ,
      ],
    );
  }
}

