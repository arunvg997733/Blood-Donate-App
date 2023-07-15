import 'package:blooddonorapp/presentation/screenadd.dart';
import 'package:blooddonorapp/presentation/screenhome.dart';
import 'package:blooddonorapp/presentation/screenupdate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(List<String> args)async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        '/':(context)=> HomeScreen(),
        '/add':(context)=> AddScreen(),
        
      },
      initialRoute: '/',
    );
  }
}