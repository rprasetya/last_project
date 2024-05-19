// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:last_project/component/home/modalBottom.dart';
import 'package:last_project/pages/SignInPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SliverAppBarGue extends StatelessWidget {
  SliverAppBarGue({super.key});
  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
      actions: [
        PopupMenuButton(
            child: const Padding(
              padding: EdgeInsets.only(right: 17),
              child: CircleAvatar(
                radius: 14,
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 140, 140, 140),
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
            ),
            onSelected: (value) async {
              if (value == 'signOut') {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Signing Out...')));
                await supabase.auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              }
            },
            itemBuilder: (context) => [
                  const PopupMenuItem(value: 'signOut', child: Text('Sign Out'))
                ]),
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
                      Expanded(child: ModalBottom()),
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
                                    fontFamily: 'Benzin-Bold', fontSize: 18),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                '',
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
    );
  }
}
