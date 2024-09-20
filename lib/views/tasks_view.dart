import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/views/add_task_view.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_card_list_view.dart';
import 'package:todo_app/widgets/custom_row_text.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddTaskView();
          }));
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            CustomAppBar(
                leftIcon: FontAwesomeIcons.bars,
                rightIcon: FontAwesomeIcons.trashCan),
            SizedBox(
              height: 50,
            ),
            CustomRowText(),
            Text(
              "1 of 2 tasks",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Divider(
                thickness: 1,
                color: Colors.grey, // Color of the line
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomCardListView(
              
            ),
          ],
        ),
      ),
    );
  }
}
