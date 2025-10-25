part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoListState extends TodoState {
  final List<String> todos;

  const TodoListState(this.todos);

  @override
  List<Object?> get props => [todos];
}
