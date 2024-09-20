import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/views/update_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.taskModel});
  final TaskModel taskModel ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return UpdateTaskView(
              taskModel: taskModel,
            );
          }));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10,right: 14),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  leading:Radio(
                    value: true, groupValue: 0, onChanged: (val){},
                    
                  ),
                  title: Text(taskModel.title ,style: TextStyle(fontSize: 24),),
                  subtitle: Text(taskModel.content,style: TextStyle(fontSize: 20),),
                ),
               const SizedBox(height: 20,),
                Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Text(taskModel.date,style:const TextStyle(fontSize: 17),),
                 
                ],
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}