import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/main_drawer.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = 'User';
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    _loadUserAndNotes();
  }

  Future<void> _loadUserAndNotes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'User';
      notes = prefs.getStringList('notes') ?? [];
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserAndNotes();
  }

  Future<void> _deleteNote(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notes.removeAt(index);
      prefs.setStringList('notes', notes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Notes'),
      ),
      drawer: MainDrawer(username: username),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: notes.isEmpty
            ? const Center(child: Text('Belum ada catatan. Buka Drawer → Add Note untuk menambahkan.'))
            : ListView.separated(
                itemCount: notes.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    title: Text(note),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        final ok = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Hapus catatan'),
                            content: const Text('Yakin mau menghapus catatan ini?'),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
                              TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Hapus')),
                            ],
                          ),
                        );
                        if (ok == true) {
                          _deleteNote(index);
                        }
                      },
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, MyApp.routeAddNote, arguments: {'index': index, 'text': note});
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyApp.routeAddNote);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
