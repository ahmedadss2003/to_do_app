import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/fetch_tasks/fetch_task_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/custom_card_item.dart';

class CustomCardListView extends StatelessWidget {
  const CustomCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTasksCubit, FetchTaskState>(
      builder: (context, state) {
        List<TaskModel> tasks= BlocProvider.of<FetchTasksCubit>(context).fetchTasks();
        
          return Expanded(
          child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return  CustomCard(
                  taskModel:tasks[index] ,
                );
        }
        ),
        );
        
         
        
      },
    );
  }
}
