import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TesPage extends StatefulWidget {
  const TesPage({super.key});

  @override
  State<TesPage> createState() => _TesPageState();
}

class _TesPageState extends State<TesPage> {
  final _future = Supabase.instance.client.from('countries').select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final countries = snapshot.data!;
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: ((context, index) {
              final country = countries[index];
              return ListTile(
                title: Text(country['name']),
              );
            }),
          );
        },
      ),
    );
  }
}
