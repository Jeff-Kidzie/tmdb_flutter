import 'package:flutter/material.dart';
import 'package:tmdb_flutter/view/detail_movie.dart';
import 'package:tmdb_flutter/view/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MainScreen(),
      routes: <String, WidgetBuilder>{
        '/detail': (context) => const DetailMovie(),
      },
    );
  }
}
