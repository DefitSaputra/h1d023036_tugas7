import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/add_note_page.dart';
import 'screens/profile_page.dart';
import 'screens/about_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String routeLogin = '/';
  static const String routeHome = '/home';
  static const String routeAddNote = '/add';
  static const String routeProfile = '/profile';
  static const String routeAbout = '/about';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'h1d023036_tugas7',

      theme: ThemeData(
        useMaterial3: true,

        // 🎨 COLOR SCHEME PREMIUM
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF), // Purple Elegant
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFF77BDF2),
          tertiary: const Color(0xFFFF6584),
          background: const Color(0xFFF6F5FF),
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: const Color(0xFFF6F5FF),

        // 🎨 INPUT FIELD MODERN
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color(0xFFD7D6E5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color(0xFF6C63FF), width: 2),
          ),
          hintStyle: TextStyle(color: Color(0xFF9E9EB5)),
        ),

        // 🎨 BUTTON STYLING
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(Color(0xFF6C63FF)), // Purple
            foregroundColor:
                WidgetStatePropertyAll(Colors.white), // Text white
            elevation: WidgetStatePropertyAll(2),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
            ),
          ),
        ),

        // 🎨 TEXT BUTTON
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Color(0xFF6C63FF)),
          ),
        ),

        // 🎨 APPBAR ELEGAN GRADIENT LOOK (Tanpa gradient langsung)
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6C63FF),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 3,
        ),

        // 🎨 CARD STYLE UNTUK NOTES
        cardTheme: CardThemeData(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // ROUTES
      initialRoute: routeLogin,
      routes: {
        routeLogin: (context) => const LoginPage(),
        routeHome: (context) => const HomePage(),
        routeAddNote: (context) => const AddNotePage(),
        routeProfile: (context) => const ProfilePage(),
        routeAbout: (context) => const AboutPage(),
      },
    );
  }
}

// ----------------------------------------------------
// Template original Flutter tetap dipertahankan.
// ----------------------------------------------------

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
