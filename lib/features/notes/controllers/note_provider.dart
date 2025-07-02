import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/note.dart';
import '../services/note_service.dart';

part 'note_provider.g.dart';

final noteServiceProvider = Provider((_) => NoteService());

@riverpod
class NoteNotifier extends _$NoteNotifier {
  @override
  Future<List<Note>> build() async {
    final service = ref.read(noteServiceProvider);
    return service.fetchNotes();
  }

  Future<void> addNote(String title, String content) async {
    final service = ref.read(noteServiceProvider);
    await service.createNote(title, content);
    state = AsyncValue.data(await service.fetchNotes());
  }

  Future<void> updateNote(String id, String title, String content) async {
    final service = ref.read(noteServiceProvider);
    await service.updateNote(id, title, content);
    state = AsyncValue.data(await service.fetchNotes());
  }

  Future<void> deleteNote(String id) async {
    final service = ref.read(noteServiceProvider);
    await service.deleteNote(id);
    state = AsyncValue.data(await service.fetchNotes());
  }
}
