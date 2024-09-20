import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constant.dart';
import 'package:todo_app/cubits/fetch_tasks/fetch_task_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/views/tasks_view.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTaskBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchTasksCubit(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        debugShowCheckedModeBanner: false,
        home: TasksView(),
      ),
    );
  }
}
