import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/notes_operation.dart';
import 'package:todo_list/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //untuk menggunakan notifier, semua yang ada didalam home screen bisa kita gunakan consumer
    //karena changenotifierprovider berada di homescreen()
    return ChangeNotifierProvider( 
      create: (context) => NotesOperation(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
      ),
    );
  }
}
