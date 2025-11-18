import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _ctrl = TextEditingController();
  int? editIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      editIndex = args['index'] as int?;
      final text = args['text'] as String?;
      if (text != null) _ctrl.text = text;
    }
  }

  Future<void> _saveNote() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('notes') ?? [];
    final text = _ctrl.text.trim();
    if (text.isEmpty) {
      _showMsg('Isi catatan terlebih dahulu');
      return;
    }
    if (editIndex != null) {
      list[editIndex!] = text;
    } else {
      list.add(text);
    }
    await prefs.setStringList('notes', list);
    if (!mounted) return;
    Navigator.popUntil(context, ModalRoute.withName(MyApp.routeHome));
  }

  void _showMsg(String m) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Info'),
        content: Text(m),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = editIndex != null ? 'Edit Note' : 'Add Note';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ctrl,
              maxLines: 5,
              decoration: const InputDecoration(hintText: 'Tulis catatan...'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _saveNote, child: const Text('Simpan')),
          ],
        ),
      ),
    );
  }
}
