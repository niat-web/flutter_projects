import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/note.dart';

class NoteService {
  final _client = Supabase.instance.client;

  Future<List<Note>> fetchNotes() async {
    final response = await _client.from('notes').select();
    return (response as List).map((e) => Note.fromJson(e)).toList();
  }

  Future<void> createNote(String title, String content) async {
    await _client.from('notes').insert({
      'title': title,
      'content': content,
      'user_id': _client.auth.currentUser!.id,
    });
  }

  Future<void> updateNote(String id, String title, String content) async {
    await _client
        .from('notes')
        .update({'title': title, 'content': content})
        .eq('id', id);
  }

  Future<void> deleteNote(String id) async {
    await _client.from('notes').delete().eq('id', id);
  }
}
