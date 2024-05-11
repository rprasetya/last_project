import 'package:flutter/material.dart';
import 'package:last_project/component/home/Book.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SliverFillRemainingGue extends StatelessWidget {
  SliverFillRemainingGue({super.key});
  final _allBooks = Supabase.instance.client.from('books').select();
  final _unfinishedBooks =
      Supabase.instance.client.from('books').select().neq('isFinished', true);
  final _finishedBooks =
      Supabase.instance.client.from('books').select().neq('isFinished', false);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: TabBarView(
      children: [
        FutureBuilder(
            future: _allBooks,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final books = snapshot.data!;
              return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: ((context, index) {
                    final book = books[index];
                    return Book(
                      title: book['title'],
                      readedPages: book['readedPages'],
                      totalPages: book['totalPages'],
                      isFinished: book['isFinished'],
                      createdAt: book['created_at'],
                    );
                  }));
            })),
        FutureBuilder(
            future: _unfinishedBooks,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final books = snapshot.data!;
              return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: ((context, index) {
                    final book = books[index];
                    return Book(
                      title: book['title'],
                      readedPages: book['readedPages'],
                      totalPages: book['totalPages'],
                      isFinished: book['isFinished'],
                      createdAt: book['created_at'],
                    );
                  }));
            })),
        FutureBuilder(
            future: _finishedBooks,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final books = snapshot.data!;
              return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: ((context, index) {
                    final book = books[index];
                    return Book(
                      title: book['title'],
                      readedPages: book['readedPages'],
                      totalPages: book['totalPages'],
                      isFinished: book['isFinished'],
                      createdAt: book['created_at'],
                    );
                  }));
            })),
      ],
    ));
  }
}
