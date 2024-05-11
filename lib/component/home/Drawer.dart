import 'package:flutter/material.dart';

class DrawerGua extends StatelessWidget {
  const DrawerGua({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 30, 30, 30)),
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
            ListTile(
              title: Text(
                'Coming Soon',
                style:
                    TextStyle(color: Colors.white, fontFamily: 'Benzin-Bold'),
              ),
            ),
            ListTile(
              title: Text(
                'Coming Soon',
                style:
                    TextStyle(color: Colors.white, fontFamily: 'Benzin-Bold'),
              ),
            ),
            ListTile(
              title: Text(
                'Coming Soon',
                style:
                    TextStyle(color: Colors.white, fontFamily: 'Benzin-Bold'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
