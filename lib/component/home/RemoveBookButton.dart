// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoveBookButton extends StatelessWidget {
  RemoveBookButton({super.key});
  final _allBooks = Supabase.instance.client.from('books').select();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ButtonStyle(
            shadowColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(0, 255, 255, 255)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            )),
            minimumSize: const WidgetStatePropertyAll(Size.fromHeight(170)),
            backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 230, 230, 230)),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  title: const Center(
                    child: Text(
                      'Remove Some Book',
                      style: TextStyle(
                          fontSize: 13, fontFamily: 'Benzin-Semibold'),
                    ),
                  ),
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: FutureBuilder(
                            future: _allBooks,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              final books = snapshot.data!;
                              return SizedBox(
                                height: 150,
                                width: double.maxFinite,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: books.length,
                                    itemBuilder: (context, index) {
                                      final book = books[index];
                                      return ListTile(
                                        title: Text(
                                          book['title'],
                                          style: const TextStyle(
                                              fontFamily: 'Benzin',
                                              fontSize: 12),
                                        ),
                                      );
                                    }),
                              );
                            }))
                  ],
                );
              }),
          child: const SizedBox(
            height: 120,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('-'),
                Text('Remove Book'),
              ],
            ),
          )),
    );
  }
}
