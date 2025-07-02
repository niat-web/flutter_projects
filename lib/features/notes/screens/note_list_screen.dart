// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import '../controllers/note_provider.dart';

// class NoteListScreen extends ConsumerWidget {
//   const NoteListScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final notes = ref.watch(noteNotifierProvider);
//     return Scaffold(
//       appBar: AppBar(title: const Text('Notes')),
//       body: notes.when(
//         data: (items) => ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (_, i) => ListTile(
//             title: Text(items[i].title),
//             onTap: () => context.go('/note/${items[i].id}'),
//           ),
//         ),
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (e, _) => Center(child: Text('Error: $e')),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.go('/note/new'),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// lib/features/notes/screens/note_list_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/note_provider.dart';

class NoteListScreen extends ConsumerWidget {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(noteNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: notes.when(
        data: (items) => ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (_, i) {
            final note = items[i];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(
                note.content.length > 50
                    ? "${note.content.substring(0, 50)}..."
                    : note.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  context.go('/note/${note.id}');
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/note/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
