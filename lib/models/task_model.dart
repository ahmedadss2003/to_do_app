

import 'package:hive_flutter/adapters.dart';

part 'task_model.g.dart';
@HiveType(typeId: 1)
class TaskModel extends HiveObject{
  @HiveField(0)
    String title ;
  @HiveField(1)
    String content;
  @HiveField(2)
  final String date;

  TaskModel({
    required this.title,
     required this.content,
     required this.date
    });
}