import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiblocprovider/bloc/counter/bloc/counter_bloc.dart';
import 'package:multiblocprovider/bloc/todo/bloc/todo_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    final todoBloc = context.read<TodoBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi BLoC Example'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Counter Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterValueState) {
                  return Text(
                    'Counter Value: ${state.counter}',
                    style: const TextStyle(fontSize: 24),
                  );
                }
                return const SizedBox();
              },
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => counterBloc.add(IncrementEvent()),
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => counterBloc.add(DecrementEvent()),
                  child: const Text('Decrement'),
                ),
              ],
            ),

            const Divider(height: 40, thickness: 2),

            const Text(
              'Todo Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: todoController,
              decoration: InputDecoration(
                hintText: 'Enter todo item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final todoText = todoController.text.trim();
                if (todoText.isNotEmpty) {
                  todoBloc.add(AddTodoEvent(todoText));
                  todoController.clear();
                }
              },
              child: const Text('Add Todo'),
            ),

            const SizedBox(height: 20),

            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoListState && state.todos.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.check_circle_outline),
                        title: Text(state.todos[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => todoBloc.add(RemoveTodoEvent(index)),
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('No todos added yet.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
