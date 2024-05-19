// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Book extends StatelessWidget {
  String title;
  int readedPages;
  int totalPages;
  bool isFinished;
  String createdAt;

  Book({
    super.key,
    required this.title,
    required this.readedPages,
    required this.totalPages,
    required this.isFinished,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromARGB(255, 225, 225, 225),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 207, 207, 207),
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.all(7),
                      child: const Icon(
                        Icons.book,
                        size: 30,
                      ),
                    ),
                    Text(
                      '$readedPages/$totalPages',
                      style: const TextStyle(
                          fontFamily: 'Benzin-Bold', fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontFamily: 'Benzin-Bold'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date Added',
                      style: TextStyle(
                          fontSize: 11.5,
                          letterSpacing: -.4,
                          color: Color.fromARGB(255, 130, 130, 130)),
                    ),
                    Text(
                      'Status',
                      style: TextStyle(
                          fontSize: 11.5,
                          letterSpacing: -.4,
                          color: Color.fromARGB(255, 130, 130, 130)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('MMMM dd, yyyy').format(
                        DateTime.parse(createdAt),
                      ),
                      style: const TextStyle(
                          fontSize: 11.5,
                          letterSpacing: -.3,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 55, 55, 55)),
                    ),
                    Text(
                      isFinished ? 'Finished' : 'Unfinished',
                      style: const TextStyle(
                          fontSize: 11.5,
                          letterSpacing: -.1,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 55, 55, 55)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
