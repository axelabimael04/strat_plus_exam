import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strat_plus_exam/src/getx/characters_provider.dart';
import 'package:strat_plus_exam/src/pages/home_page.dart';

void main() async {
  await Get.put(MarvelCharactersProvider()).init();
  runApp(const StratPlusApp());
}

class StratPlusApp extends StatelessWidget {
  const StratPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Strat Plus App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
