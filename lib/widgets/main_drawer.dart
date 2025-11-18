import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class MainDrawer extends StatelessWidget {
  final String username;
  const MainDrawer({super.key, required this.username});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    if (!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, MyApp.routeLogin, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username),
            accountEmail: Text('$username@example.com'),
            currentAccountPicture: CircleAvatar(child: Text(username.isNotEmpty ? username[0].toUpperCase() : 'U')),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, MyApp.routeHome);
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add),
            title: const Text('Add Note'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, MyApp.routeAddNote);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, MyApp.routeProfile);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, MyApp.routeAbout);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
