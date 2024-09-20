import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/cubits/fetch_tasks/fetch_task_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_divider.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

class UpdateTaskView extends StatelessWidget {
  const UpdateTaskView({super.key, required this.taskModel});
  final TaskModel taskModel ;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =TextEditingController(text: taskModel.title);
    final TextEditingController subTitlController =TextEditingController(text: taskModel.content);;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 150,),
          const Row(
            children: [
              CustomDivider(),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: Text("Update Task",
                 style: TextStyle(
                  fontSize: 40 ,
                  
                  fontWeight: FontWeight.w600
                 ),
                 ),
               ),  
              CustomDivider(),
              
            ], 
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
              "What are You Planing!",
              style: TextStyle(
                fontSize:17,
              ),
            ),
            CustomTextFormField(
              onChanged: (valus){
                
              },
              controller: titleController,
            ),
            const SizedBox(height: 100,),
            const Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            const SizedBox(height: 30,),         
            CustomTextFormField(
              controller:subTitlController ,
              hintText: "Update Task",
              icon: FontAwesomeIcons.bookmark,
            ),
            const SizedBox(height: 50,),         
            CustomButton(
              onPressed: (){
                taskModel.title = titleController.text ;
                taskModel.content = subTitlController.text ;
                taskModel.save();
                BlocProvider.of<FetchTasksCubit>(context).fetchTasks();
                Navigator.pop(context);
              },
            )
            ],
            ),
          )
        ],
      ),
    );
  }
}
