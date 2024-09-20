part of 'fetch_task_cubit.dart';

@immutable
sealed class FetchTaskState {}

final class FetchTaskInitial extends FetchTaskState {}
final class FetchTasLoading extends FetchTaskState {}
final class FetchTaskSuccess extends FetchTaskState {}
