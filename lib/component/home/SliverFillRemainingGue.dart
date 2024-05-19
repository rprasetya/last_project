// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:last_project/component/home/Book.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SliverFillRemainingGue extends StatelessWidget {
  SliverFillRemainingGue({super.key});

  final _allBooks = Supabase.instance.client.from('books').select();
  final _unfinishedBooks =
      Supabase.instance.client.from('books').select().eq('isFinished', false);
  final _finishedBooks =
      Supabase.instance.client.from('books').select().eq('isFinished', true);

  final userAuth = Supabase.instance.client.auth.getUser();

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: TabBarView(
      children: [
        FutureBuilder(
            future: userAuth,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final user = snapshot.data!.user?.id;
              return FutureBuilder(
                  future: _allBooks.eq('userId', user.toString()),
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
                  }));
            })),
        FutureBuilder(
            future: userAuth,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final user = snapshot.data!.user?.id;
              return FutureBuilder(
                  future: _unfinishedBooks.eq('userId', user.toString()),
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
                  }));
            })),
        FutureBuilder(
            future: userAuth,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final user = snapshot.data!.user?.id;
              return FutureBuilder(
                  future: _finishedBooks.eq('userId', user.toString()),
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
                  }));
            })),
      ],
    ));
  }
}
