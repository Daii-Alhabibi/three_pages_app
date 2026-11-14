import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Three Pages App',

      // Bonus 1: Custom Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: const Color(0xFFF8F7FF),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE0E3FA),
          foregroundColor: Colors.indigo,
          centerTitle: true,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
      ),

      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<String> titles = ['Home', 'About', 'Contact'];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(onNext: () => changePage(1)),
      AboutPage(onNext: () => changePage(2)),
      ContactPage(onNext: () => changePage(0)),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(titles[selectedIndex])),

      body: pages[selectedIndex],

      // Bonus 2: BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changePage,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFEEEFFA),

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  final VoidCallback onNext;

  const HomePage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/home.png', width: 260),

            const SizedBox(height: 25),

            const Text(
              'Home Page',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text('Welcome to our Flutter app!'),

            const SizedBox(height: 25),

            ElevatedButton(onPressed: onNext, child: const Text('Go to About')),
          ],
        ),
      ),
    );
  }
}

// About Page
class AboutPage extends StatelessWidget {
  final VoidCallback onNext;

  const AboutPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info_outline, size: 100, color: Colors.indigo),

            const SizedBox(height: 25),

            const Text(
              'About Page',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text(
              'This app demonstrates Flutter navigation.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: onNext,
              child: const Text('Go to Contact'),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact Page
class ContactPage extends StatelessWidget {
  final VoidCallback onNext;

  const ContactPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mail_outline, size: 100, color: Colors.indigo),

            const SizedBox(height: 25),

            const Text(
              'Contact Page',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text('Thank you for visiting our app!'),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: onNext,
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
