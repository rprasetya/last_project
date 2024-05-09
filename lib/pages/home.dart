import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:last_project/component/Book.dart';
import 'package:last_project/component/RemoveBookButton.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _allBooks = Supabase.instance.client.from('books').select();
  final _unfinishedBooks =
      Supabase.instance.client.from('books').select().neq('isFinished', true);
  final _finishedBooks =
      Supabase.instance.client.from('books').select().neq('isFinished', false);

  final TextEditingController _readedPageController = TextEditingController();
  final TextEditingController _totalPageController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: SafeArea(
          child: Drawer(
            child: Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 30, 30, 30)),
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
                  ListTile(
                    title: Text(
                      'Coming Soon',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Benzin-Bold'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Coming Soon',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Benzin-Bold'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Coming Soon',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Benzin-Bold'),
                    ),
                  ),
                ],
              ),
            ),
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
              'Bookshelf Apps',
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
                            right: 18, left: 18, top: 85, bottom: 15),
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
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 400,
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 3.5,
                                                    width: 27,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 3.5),
                                                    decoration: const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 169, 169, 169),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                  ),
                                                  const SizedBox(
                                                    height: 22.5,
                                                  ),
                                                  const Text(
                                                    'Add A New Book',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Benzin-Medium'),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 30),
                                                    child: Form(
                                                        child: Column(
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right:
                                                                          10),
                                                              child: const Icon(
                                                                Icons
                                                                    .book_outlined,
                                                                size: 40,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        13.5),
                                                                controller:
                                                                    _titleController,
                                                                decoration: const InputDecoration(
                                                                    hintText:
                                                                        'Title',
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            14)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right:
                                                                          10),
                                                              child: const Icon(
                                                                Icons
                                                                    .first_page_rounded,
                                                                size: 40,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter
                                                                      .digitsOnly
                                                                ],
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        13.5),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    _readedPageController,
                                                                decoration: const InputDecoration(
                                                                    hintText:
                                                                        'Readed Pages',
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            14)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right:
                                                                          10),
                                                              child: const Icon(
                                                                Icons
                                                                    .last_page_rounded,
                                                                size: 40,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter
                                                                      .digitsOnly
                                                                ],
                                                                controller:
                                                                    _totalPageController,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        13.5),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration: const InputDecoration(
                                                                    hintText:
                                                                        'Total Pages',
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            14)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 35,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: ElevatedButton(
                                                                      style: ButtonStyle(
                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        )),
                                                                        backgroundColor: MaterialStateProperty.all<Color>(const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            19,
                                                                            19,
                                                                            19)),
                                                                      ),
                                                                      onPressed: () => showDialog(
                                                                          context: context,
                                                                          builder: (BuildContext context) {
                                                                            if (_readedPageController.text.isEmpty ||
                                                                                _titleController.text.isEmpty ||
                                                                                _totalPageController.text.isEmpty) {
                                                                              return CupertinoAlertDialog(
                                                                                title: const Text('Warning !'),
                                                                                content: const Text('Fill All The Blank Form'),
                                                                                actions: [
                                                                                  CupertinoDialogAction(
                                                                                      onPressed: () {
                                                                                        Navigator.of(context).pop();
                                                                                      },
                                                                                      child: const Text(
                                                                                        'Close',
                                                                                        style: TextStyle(color: Colors.black, fontSize: 13.5),
                                                                                      ))
                                                                                ],
                                                                              );
                                                                            } else if (int.parse(_readedPageController.text) > int.parse(_totalPageController.text)) {
                                                                              return CupertinoAlertDialog(
                                                                                title: const Text('Warning!'),
                                                                                content: const Text("Readed Pages can't be more than Total Pages"),
                                                                                actions: [
                                                                                  CupertinoDialogAction(
                                                                                      child: TextButton(
                                                                                          onPressed: () {
                                                                                            Navigator.of(context).pop();
                                                                                          },
                                                                                          child: const Text(
                                                                                            'Close',
                                                                                            style: TextStyle(color: Colors.black, fontSize: 13.5),
                                                                                          )))
                                                                                ],
                                                                              );
                                                                            }
                                                                            return CupertinoAlertDialog(
                                                                              title: const Text('Accept?'),
                                                                              content: const Text('Do you accept the book?'),
                                                                              actions: [
                                                                                CupertinoDialogAction(
                                                                                    child: TextButton(
                                                                                  child: const Text(
                                                                                    'Nope',
                                                                                    style: TextStyle(color: Colors.black),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                )),
                                                                                CupertinoDialogAction(
                                                                                    child: TextButton(
                                                                                  child: const Text(
                                                                                    'Hell Yeah',
                                                                                    style: TextStyle(color: Colors.black),
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    await supabase.from('books').insert({
                                                                                      'title': _titleController.text,
                                                                                      'readedPages': int.parse(_readedPageController.text),
                                                                                      'totalPages': int.parse(_totalPageController.text),
                                                                                      'isFinished': int.parse(_totalPageController.text) == int.parse(_readedPageController.text),
                                                                                    });
                                                                                    showDialog(
                                                                                        context: context,
                                                                                        builder: (BuildContext context) {
                                                                                          return CupertinoAlertDialog(
                                                                                            title: const Text('Success'),
                                                                                            content: const Text('The book has been added!'),
                                                                                            actions: [
                                                                                              CupertinoDialogAction(
                                                                                                  child: TextButton(
                                                                                                      onPressed: () {
                                                                                                        Navigator.of(context).pop();
                                                                                                        Navigator.of(context).pop();
                                                                                                        Navigator.of(context).pop();
                                                                                                        DefaultTabController.of(context).animateTo(1);
                                                                                                      },
                                                                                                      child: const Text(
                                                                                                        'Close',
                                                                                                        style: TextStyle(color: Colors.black),
                                                                                                      )))
                                                                                            ],
                                                                                          );
                                                                                        });
                                                                                  },
                                                                                )),
                                                                              ],
                                                                            );
                                                                          }),
                                                                      child: const Text(
                                                                        'Add Book',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Benzin',
                                                                            fontSize:
                                                                                10.5,
                                                                            color:
                                                                                Colors.white),
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            shape:
                                                                                MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            )),
                                                                            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
                                                                                255,
                                                                                94,
                                                                                0,
                                                                                0)),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Cancel',
                                                                            style: TextStyle(
                                                                                fontFamily: 'Benzin',
                                                                                fontSize: 10.5,
                                                                                color: Colors.white),
                                                                          )),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
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
                            // const SizedBox(
                            //   width: 17,
                            // ),
                            // RemoveBookButton(),
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
                                      '',
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
