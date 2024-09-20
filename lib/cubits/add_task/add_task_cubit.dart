import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/constant.dart';
import 'package:todo_app/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(TaskModel task)async{
    emit(AddTaskLoaded());
    try {
      var box = Hive.box<TaskModel>(kTaskBox);
      await box.add(task);
      emit(AddTaskSuccess()) ;
  } catch (e) {
    emit(AddTaskFailure(errMessage: e.toString()));
  }
  }
}
