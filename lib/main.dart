import 'package:flutter/material.dart';
import 'package:pokemood/get_it_config.dart';
import 'package:pokemood/pages/region/region_page.dart';


void main() {
  runApp(const MainApp());
  GetItConfig.setUp();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Pokemood",
      debugShowCheckedModeBanner: false,
      home: RegionPage(),
    );
  }
}
