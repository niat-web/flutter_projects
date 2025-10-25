import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoListState([])) {
    on<AddTodoEvent>((event, emit) {
      // If current state already has todos, copy them, else start new list
      final currentTodos = List<String>.from((state as TodoListState).todos);

      currentTodos.add(event.todo);
      emit(TodoListState(currentTodos));
    });

    on<RemoveTodoEvent>((event, emit) {
      final currentTodos = List<String>.from((state as TodoListState).todos);

      if (event.index >= 0 && event.index < currentTodos.length) {
        currentTodos.removeAt(event.index);
        emit(TodoListState(currentTodos));
      }
    });
  }
}
