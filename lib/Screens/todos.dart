
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appdev_2/Screens/create_todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Models/todo.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

final todoListProvider = FutureProvider<List<Todo>>((ref) async {
  QuerySnapshot snapshot = await db.collection('todos').get();
  List<Todo> fetchedTodos = snapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Todo(
        title: data['title'],
        desc: data['desc']
    );
  }).toList();
  return fetchedTodos;
});

class _TodosState extends State<Todos> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('todos').snapshots();
  List<Todo> todos = [];
  @override
  void initState() {
    super.initState();
    getAllTodos();
  }
  Future<void> getAllTodos() async {

    QuerySnapshot snapshot = await db.collection('todos').get();
    List<Todo> fetchedTodos = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Todo(
        title: data['title'],
        desc: data['desc']
      );
    }).toList();
    setState(() {
      todos = fetchedTodos;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My new App'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateTodo()));
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['title']),
                subtitle: Text(data['desc']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
