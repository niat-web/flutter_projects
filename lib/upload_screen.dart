import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io'; // Add this import

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final supabase = Supabase.instance.client;
  String uploadedUrl = "";

  Future<void> uploadFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
      withData: false, // We’ll read from path instead
    );

    if (result != null && result.files.single.path != null) {
      final file = result.files.single;
      final filename = p.basename(file.name);

      // Read the file bytes from the file path
      final fileBytes = await File(file.path!).readAsBytes();

      // Upload to Supabase storage
      await supabase.storage
          .from("studentfiless")
          .uploadBinary(filename, fileBytes);

      // Get public URL
      final publicUrl = supabase.storage
          .from("studentfiless")
          .getPublicUrl(filename);

      setState(() {
        uploadedUrl = publicUrl;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("File not uploaded")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload files to supabase storage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: uploadFile, child: Text("Upload")),
            SizedBox(height: 10),
            Text("uploaded url:$uploadedUrl"),
          ],
        ),
      ),
    );
  }
}
