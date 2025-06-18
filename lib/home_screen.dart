import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show Supabase;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final supabase = Supabase.instance.client;
  List<dynamic> students = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final res = await supabase.from("Students").select().order("id");
    setState(() {
      students = res;
    });
  }

  Future<void> addStudentsData() async {
    await supabase.from("Students").insert({
      'name': _nameController.text,
      'age': int.tryParse(_ageController.text) ?? 0,
    });
    _nameController.clear;
    _ageController.clear;
    fetchData();
  }

  Future<void> updateStudent(int id, String name, int age) async {
    await supabase
        .from("Students")
        .update({"name": name, "age": age})
        .eq("id", id);
    fetchData();
  }

  Future<void> delete(int id) async {
    await supabase.from("Students").delete().eq("id", id);
    fetchData();
  }

  void updateWidget(Map student) {
    _nameController.text = student['name'];
    _ageController.text = student['age'].toString();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update student"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              updateStudent(
                student['id'],
                _nameController.text,
                int.parse(_ageController.text),
              );
              Navigator.pop(context);
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Supabase Crud Operations")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: "Age"),
                ),
                ElevatedButton(onPressed: addStudentsData, child: Text("Add")),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return ListTile(
                    leading: Text(
                      "${student['name']}  (Age:${student['age']})",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            updateWidget(student);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(onPressed: () => delete(student['id']), icon: Icon(Icons.delete)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
