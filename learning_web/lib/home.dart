import 'package:flutter/material.dart';
import 'package:learning_web/creata.dart';
import 'package:learning_web/delete.dart';
import 'package:learning_web/fetch.dart';
import 'package:learning_web/update.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateData()));
              },
              child: const Text("CREATE")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FetchData()));
              },
              child: const Text("READ")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateScreen()));
              },
              child: const Text("UPDATE")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeleteScreen()));
              },
              child: const Text("DELETE")),
        ],
      ),
    );
  }
}
