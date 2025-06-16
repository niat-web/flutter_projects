import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController _taskController = TextEditingController();

  List<String> taskTitles = [];
  List<bool> taskStatus = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTasks();
  }

  void saveTask() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList("titles", taskTitles);
      prefs.setStringList(
        "status",
        taskStatus.map((e) => e.toString()).toList(),
      );
    });
    _taskController.clear();
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      taskTitles = prefs.getStringList("titles") ?? [];
      taskStatus =
          prefs.getStringList('status')?.map((e) => e == 'true').toList() ?? [];
    });
  }

  void addTask(String title) {
    setState(() {
      taskTitles.add(title);
      taskStatus.add(false);
    });
    saveTask();
  }

  void updateTask(int index, bool? val) {
    setState(() {
      taskStatus[index] = val ?? false;
    });
    saveTask();
  }

  void deleteTask(int index) {
    setState(() {
      taskTitles.removeAt(index);
      taskStatus.removeAt(index);
    });
    saveTask();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Task Management",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.indigo.shade400,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your Task", style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Task",
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      addTask(_taskController.text);
                    },
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade400,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: taskTitles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: taskStatus[index],
                        onChanged: (val) => updateTask(index, val),
                      ),
                      title: Text(
                        taskTitles[index],

                        style: TextStyle(
                          decoration: taskStatus[index]
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          deleteTask(index);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
