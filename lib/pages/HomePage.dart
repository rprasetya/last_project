import 'package:flutter/material.dart';
import 'package:last_project/component/home/Drawer.dart';
import 'package:last_project/component/home/SliverAppBarGue.dart';
import 'package:last_project/component/home/SliverFillRemainingGue.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const SafeArea(child: DrawerGua()),
        body: CustomScrollView(
            slivers: [const SliverAppBarGue(), SliverFillRemainingGue()]),
      ),
    );
  }
}
