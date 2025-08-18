import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDbScreen extends StatefulWidget {
  const FirebaseDbScreen({super.key});

  @override
  State<FirebaseDbScreen> createState() => _FirebaseDbScreenState();
}

class _FirebaseDbScreenState extends State<FirebaseDbScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  List<Map<String, dynamic>> students = [];

  final CollectionReference studentsCollection = FirebaseFirestore.instance
      .collection("students");

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // READ
  Future<void> fetchData() async {
    final snapshot = await studentsCollection.orderBy("id").get();
    setState(() {
      students = snapshot.docs.map((doc) {
        return {
          "id": doc.id, // Firestore doc ID
          "name": doc["name"],
          "age": doc["age"],
          "studentId": doc["studentId"], // Custom numeric ID
        };
      }).toList();
    });
  }

  // CREATE
  Future<void> addData() async {
    if (nameController.text.isEmpty || ageController.text.isEmpty) return;

    final snapshot = await studentsCollection.get();
    int nextId = snapshot.size + 1; // auto-increment like your Supabase example

    await studentsCollection.add({
      "studentId": nextId,
      "name": nameController.text,
      "age": int.tryParse(ageController.text),
    });

    nameController.clear();
    ageController.clear();
    fetchData();
  }

  // UPDATE
  Future<void> updateData(String docId, String name, int age) async {
    await studentsCollection.doc(docId).update({"name": name, "age": age});
    fetchData();
  }

  // DELETE
  Future<void> deleteData(String docId) async {
    await studentsCollection.doc(docId).delete();
    fetchData();
  }

  void updateWidget(Map student) {
    nameController.text = student["name"];
    ageController.text = student['age'].toString();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update student data"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "name"),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "age"),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    updateData(
                      student["id"], // Firestore doc ID
                      nameController.text,
                      int.parse(ageController.text),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CRUD operations using Firebase")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "name"),
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(labelText: "age"),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(onPressed: addData, child: const Text("Add")),
              ],
            ),
           Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: studentsCollection.orderBy("studentId").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No students found"));
                  }

                  final data = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final doc = data[index];
                      final student = {
                        "id": doc.id,
                        "name": doc["name"],
                        "age": doc["age"],
                        "studentId": doc["studentId"],
                      };

                      return ListTile(
                        title: Text(
                          "${student['name']} (Age: ${student['age']})",
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => updateWidget(student),
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () => deleteData(student["id"]),
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
