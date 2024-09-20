import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubits/add_task/add_task_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

class CustomFormValidator extends StatefulWidget {
  const CustomFormValidator({
    super.key,
  });

  @override
  State<CustomFormValidator> createState() => _CustomFormValidatorState();
}

class _CustomFormValidatorState extends State<CustomFormValidator> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? title , subTitle ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(// to listen for state changes from the AddTaskCubit
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What are You Planing!",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
               CustomTextFormField(
                onSaved: (val){
                  title =val ;
                },
              ),
              const SizedBox(
                height: 100,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
               CustomTextFormField(
                onSaved: (val){
                  subTitle = val ;
                },
                hintText: "Add Task",
                icon: FontAwesomeIcons.bookmark,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(child: CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    DateTime now = DateTime.now();
                    String formattedDate = DateFormat('dd-MM-yyyy').format(now);                    
                    TaskModel task = TaskModel(title: title!, content: subTitle!, date: formattedDate);
                    
                    BlocProvider.of<AddTaskCubit>(context).addTask(task);
                    
                  }
                },
              ))
            ],
          ),
        );
      },
    );
  }
}
