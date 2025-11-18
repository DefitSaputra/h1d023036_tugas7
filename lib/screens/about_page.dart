import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      drawer: const MainDrawer(username: 'User'),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'H1D023036_Tugas7 — Notes & Profile App\n\n'
          'Aplikasi sederhana untuk keperluan tugas: login, drawer, local storage, dan CRUD notes.\n\n',
        ),
      ),
    );
  }
}
