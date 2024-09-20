import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_task/add_task_cubit.dart';
import 'package:todo_app/cubits/fetch_tasks/fetch_task_cubit.dart';
import 'package:todo_app/widgets/custom_divider.dart';
import 'package:todo_app/widgets/custom_form_validator.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddTaskCubit(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Row(
              children: [
                CustomDivider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Add New Task",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                ),
                CustomDivider(),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: BlocConsumer<AddTaskCubit, AddTaskState>(
                listener: (context, state) {
                  if(state is AddTaskFailure){
                    print("add task again") ;
                  }
                  if(state is AddTaskSuccess){
                context.read<FetchTasksCubit>().fetchTasks();
                Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return CustomFormValidator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
