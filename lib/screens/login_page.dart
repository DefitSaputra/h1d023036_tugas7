import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkAlreadyLogged();
  }

  Future<void> _checkAlreadyLogged() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('username');
    if (saved != null && saved.isNotEmpty) {
      // langsung ke home
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, MyApp.routeHome);
    } else {
      setState(() => _loading = false);
    }
  }

  Future<void> _doLogin({bool saveSession = true}) async {
    final u = _userCtrl.text.trim();
    final p = _passCtrl.text;

    if (u.isEmpty) {
      _showMessage('Isi username terlebih dahulu');
      return;
    }
    if (p.isEmpty) {
      // login guest
      final prefs = await SharedPreferences.getInstance();
      if (saveSession) await prefs.setString('username', 'guest_$u');
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, MyApp.routeHome);
      return;
    }

    // contoh valid username/password (admin/admin)
    if (u == 'admin' && p == 'admin') {
      final prefs = await SharedPreferences.getInstance();
      if (saveSession) await prefs.setString('username', u);
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, MyApp.routeHome);
    } else {
      _showMessage('Username / Password salah (pakai admin/admin atau kosong password untuk guest)');
    }
  }

  void _showMessage(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Info'),
        content: Text(msg),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    TextField(
                      controller: _userCtrl,
                      decoration: const InputDecoration(hintText: 'Masukkan Username'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _passCtrl,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Masukkan Password (atau kosong untuk guest)'),
                    ),
                    const SizedBox(height: 18),
                    ElevatedButton(
                      onPressed: () => _doLogin(),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        // Pilihan cepat: login tanpa menyimpan (guest)
                        _doLogin(saveSession: false);
                      },
                      child: const Text('Masuk tanpa menyimpan (sesi sementara)'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
