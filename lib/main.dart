import 'package:flutter/material.dart';
import 'package:last_project/pages/HomePage.dart';
import 'package:last_project/pages/SignInPage.dart';
import 'package:last_project/pages/SignUpPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://uxxkfjyvitjydplbvrbd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV4eGtmanl2aXRqeWRwbGJ2cmJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0OTE2MDEsImV4cCI6MjAyOTA2NzYwMX0.iiy3beYybz8ppRkac8oJihbSiJNM8mSVpq1xzJRyDIg',
  );
  runApp(const BookshelfApps());
}

class BookshelfApps extends StatelessWidget {
  const BookshelfApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 240, 240, 240)),
      routes: {
        '/': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}
