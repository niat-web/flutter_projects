import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/note_provider.dart';

class NoteDetailScreen extends ConsumerStatefulWidget {
  final String noteId;
  const NoteDetailScreen({super.key, required this.noteId});

  @override
  ConsumerState<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends ConsumerState<NoteDetailScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final noteNotifier = ref.read(noteNotifierProvider.notifier);
    
    final isNew = widget.noteId == 'new';

    return Scaffold(
      appBar: AppBar(title: Text(isNew ? 'New Note' : 'Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (isNew) {
                  await noteNotifier.addNote(
                    titleController.text,
                    contentController.text,
                  );
                } else {
                  await noteNotifier.updateNote(
                    widget.noteId,
                    titleController.text,
                    contentController.text,
                  );
                }
                if (mounted) context.go('/notes');
              },
              child: const Text('Save'),
            ),
            if (!isNew)
              TextButton(
                onPressed: () async {
                  await noteNotifier.deleteNote(widget.noteId);
                  if (mounted) context.go('/notes');
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
