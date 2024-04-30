import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Bookshelf Apps',
            style: TextStyle(color: Color.fromARGB(230, 255, 255, 255)),
          ),
          centerTitle: true,
          bottom: const TabBar(indicatorColor: Colors.white, tabs: <Widget>[
            Tab(
              child: Text(
                'unfinished',
                style: TextStyle(color: Color.fromARGB(230, 255, 255, 255)),
              ),
            ),
            Tab(
              child: Text(
                'finished',
                style: TextStyle(color: Color.fromARGB(230, 255, 255, 255)),
              ),
            ),
          ]),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
