import 'package:flutter/material.dart';
import 'package:last_project/component/Book.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _allBooks = Supabase.instance.client.from('books').select();
  final _unfinishedBooks =
      Supabase.instance.client.from('books').select().neq('isFinished', true);
  final _finishedBooks =
      Supabase.instance.client.from('books').select().neq('isFinished', false);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 16, 16, 16)),
                child: Text(
                  'Bookshelf Apps',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Benzin-Medium'),
                ),
              ),
            ],
          ),
        ),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 240, 240, 240),
            centerTitle: true,
            pinned: true,
            iconTheme: const IconThemeData(color: Colors.black),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.bento_outlined),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            title: const Text(
              'Raul Paoli',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Benzin-Medium',
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 17),
                child: CircleAvatar(
                  radius: 13,
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 140, 140, 140),
                  child: Icon(
                    Icons.person,
                    size: 20,
                  ),
                ),
              )
            ],
            expandedHeight: 355,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 22, left: 22, top: 63, bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromARGB(0, 255, 255, 255)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size.fromHeight(170)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 230, 230, 230)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                  ),
                                  onPressed: () {},
                                  child: const SizedBox(
                                    width: double.infinity,
                                    height: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '+',
                                        ),
                                        Text(
                                          'Add New Book',
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromARGB(0, 255, 255, 255)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size.fromHeight(170)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 230, 230, 230)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                  ),
                                  onPressed: () {},
                                  child: const SizedBox(
                                    height: 120,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('+'),
                                        Text('Add New Book'),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'My Books',
                                      style: TextStyle(
                                          fontFamily: 'Benzin-Bold',
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 18,
                                    ),
                                    Text(
                                      '27',
                                      style: TextStyle(
                                          fontFamily: 'Benzin-Bold',
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              255, 164, 164, 164)),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.more_horiz,
                                  size: 30,
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Check and manage your books',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 140, 140, 140)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                color: const Color.fromARGB(255, 240, 240, 240),
                child: const Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          child: Text(
                            'All',
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 1,
                              fontFamily: 'Benzin-Medium',
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Unfinished',
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 1,
                              fontFamily: 'Benzin-Medium',
                            ),
                          ),
                        ),
                        Tab(
                          child: Text('Finished',
                              style: TextStyle(
                                  fontSize: 11,
                                  letterSpacing: 1,
                                  fontFamily: 'Benzin-Medium')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
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
          ))
        ]),
      ),
    );
  }
}
