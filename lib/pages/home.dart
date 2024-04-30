import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final _future = Supabase.instance.client.from('countries').select();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                  Icons.bento_outlined), // Ganti dengan ikon yang Anda inginkan
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
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 16, 16, 16)),
              child: Text(
                'Bookshelf Apps',
                style:
                    TextStyle(color: Colors.white, fontFamily: 'Benzin-Medium'),
              ),
            ),
          ],
        ),
      ),
      body: ListView(children: [
        DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 22, left: 22, top: 8, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(0, 255, 255, 255)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            minimumSize: const MaterialStatePropertyAll(
                                Size.fromHeight(170)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 230, 230, 230)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {},
                          child: const SizedBox(
                            width: double.infinity,
                            height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            shadowColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(0, 255, 255, 255)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            minimumSize: const MaterialStatePropertyAll(
                                Size.fromHeight(170)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 230, 230, 230)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {},
                          child: const SizedBox(
                            height: 120,
                            width: double
                                .infinity, // Menjadikan lebar tombol penuh
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontFamily: 'Benzin-Bold', fontSize: 18),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Text(
                              '27',
                              style: TextStyle(
                                  fontFamily: 'Benzin-Bold',
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 164, 164, 164)),
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
                                color: Color.fromARGB(255, 140, 140, 140)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: (const Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      height: 38,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorColor: Colors.black,
                          labelColor: Colors
                              .black, // Warna untuk teks tab yang terpilih
                          unselectedLabelColor: Colors
                              .grey, // Warna untuk teks tab yang tidak terpilih
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
                      ),
                    ))),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 225, 225, 225),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      foregroundColor: Colors.black,
                                      backgroundColor:
                                          Color.fromARGB(255, 210, 210, 210),
                                      child: Icon(
                                        Icons.book,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      '505/2112',
                                      style: TextStyle(
                                          fontFamily: 'Benzin-Bold',
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Flexible(
                                        child: Text(
                                          'Tukang Bubur Naik Kahim',
                                          style: TextStyle(
                                              fontFamily: 'Benzin-Bold'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date Added',
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          letterSpacing: -.4,
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                            fontSize: 11.5,
                                            letterSpacing: -.4,
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '09 Nov 2011',
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          letterSpacing: -.3,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 55, 55, 55)),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        'Unfinished',
                                        style: TextStyle(
                                            fontSize: 11.5,
                                            letterSpacing: -.1,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 55, 55, 55)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 225, 225, 225),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      foregroundColor: Colors.black,
                                      backgroundColor:
                                          Color.fromARGB(255, 210, 210, 210),
                                      child: Icon(
                                        Icons.book,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      '505/2112',
                                      style: TextStyle(
                                          fontFamily: 'Benzin-Bold',
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Flexible(
                                        child: Text(
                                          'Tukang Bubur Naik Kahim',
                                          style: TextStyle(
                                              fontFamily: 'Benzin-Bold'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date Added',
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          letterSpacing: -.4,
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                            fontSize: 11.5,
                                            letterSpacing: -.4,
                                            color: Color.fromARGB(
                                                255, 130, 130, 130)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '09 Nov 2011',
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          letterSpacing: -.3,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 55, 55, 55)),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        'Unfinished',
                                        style: TextStyle(
                                            fontSize: 11.5,
                                            letterSpacing: -.1,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 55, 55, 55)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'unfinished',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        'finished',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ]),
    );
  }
}
