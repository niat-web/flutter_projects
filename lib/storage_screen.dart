import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({super.key});

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  final supabase = Supabase.instance.client;
  var uploadedUrl = "";

  Future<void> uploadFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      final file = result.files.single;
      final filename = p.basename(file.path!);

      final fileBytes = await File(file.path!).readAsBytes();
      await supabase.storage
          .from("studentData")
          .uploadBinary(filename, fileBytes);

      final publicUrl = await supabase.storage
          .from("studentData")
          .getPublicUrl(filename);

      setState(() {
        uploadedUrl = publicUrl;
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("File not selected")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SUpabase Storage")),
      body: Column(
        children: [
          ElevatedButton(onPressed: uploadFile, child: Text("Upload File")),
        ],
      ),
    );
  }
}
