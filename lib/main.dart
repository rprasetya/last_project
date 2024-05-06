import 'package:flutter/material.dart';
import 'package:last_project/pages/home.dart';
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
      home: HomePage(),
    );
  }
}