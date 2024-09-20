import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.icon, this.onSaved, this.controller, this.onChanged});
  final String? hintText ;
  final IconData? icon ;
  final TextEditingController? controller ;
  final void Function(String?)? onSaved ;
  final Function(String)? onChanged ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      controller: controller,
      onSaved: onSaved,
      validator: (value) {
        if(value==null||value.isEmpty){
          return "Field is Reqired";
        }
      },
      cursorHeight: 40,
      decoration: InputDecoration(
        border: InputBorder.none, 
        hintText: hintText ,
        prefixIcon: Icon(icon),
      ),
    );
  }
}