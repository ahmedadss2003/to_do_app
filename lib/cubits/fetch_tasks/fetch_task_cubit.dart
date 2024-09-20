import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/constant.dart';
import 'package:todo_app/models/task_model.dart';

part 'fetch_task_state.dart';

class FetchTasksCubit extends Cubit<FetchTaskState> {
  FetchTasksCubit() : super(FetchTaskInitial());
  
  List<TaskModel> fetchTasks(){
    emit(FetchTasLoading());
    
      var box = Hive.box<TaskModel>(kTaskBox);
      List<TaskModel>task = box.values.toList();
      emit(FetchTaskSuccess());
      return task;
      
  }
}
