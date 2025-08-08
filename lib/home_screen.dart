import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final supabase = Supabase.instance.client;
  List<dynamic> result = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final res = await supabase.from("students").select().order("id");
    setState(() {
      result = res;
    });
  }

  Future<void> addData() async {
    await supabase.from("students").insert({
      "name": nameController.text,
      "age": int.tryParse(ageController.text),
    });
    nameController.clear();
    ageController.clear();
    fetchData();
  }

  Future<void> deleteData(int id) async {
    await supabase.from("students").delete().eq("id", id);
    fetchData();
  }

  Future<void> updateData(int id, String name, int age) async {
    await supabase
        .from("students")
        .update({"name": name, "age": age})
        .eq("id", id);
    fetchData();
  }

  void updateWidget(Map student) {
    nameController.text = student["name"];
    ageController.text = student["age"].toString();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Student Data"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                hintText: "Enter your Name",
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Age",
                hintText: "Enter your Age",
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              updateData(
                student["id"],
                nameController.text,
                int.parse(ageController.text),
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
      appBar: AppBar(title: Text("Home Screen")),
      body: Column(
        children: [
          Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  hintText: "Enter your Name",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Age",
                  hintText: "Enter your Age",
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: addData, child: Text("Submit")),
            ],
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  final studentdata = result[index];
                  return ListTile(
                    leading: Text(
                      "${studentdata["name"]}  (Age: ${studentdata["age"]})",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            updateWidget(studentdata);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteData(studentdata["id"]);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
