import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Book extends StatelessWidget {
  String title;
  int readedPages;
  int totalPages;
  bool isFinished;
  String createdAt;

  Book({
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
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 13),
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
                    const CircleAvatar(
                      radius: 25,
                      foregroundColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 210, 210, 210),
                      child: Icon(
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
                    SizedBox(
                      width: 200,
                      child: Flexible(
                        child: Text(
                          title,
                          style: const TextStyle(fontFamily: 'Benzin-Bold'),
                        ),
                      ),
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
                    SizedBox(
                      width: 80,
                      child: Text(
                        'Status',
                        style: TextStyle(
                            fontSize: 11.5,
                            letterSpacing: -.4,
                            color: Color.fromARGB(255, 130, 130, 130)),
                      ),
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
                    SizedBox(
                      width: 80,
                      child: Text(
                        isFinished ? 'Finished' : 'Unfinished',
                        style: const TextStyle(
                            fontSize: 11.5,
                            letterSpacing: -.1,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 55, 55, 55)),
                      ),
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
