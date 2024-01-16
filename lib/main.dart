import 'package:flutter/material.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/page/search_page.dart';
import 'package:pokemonsearchapp/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const SearchPage(),
    );
  }
}
