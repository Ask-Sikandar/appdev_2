

import 'package:appdev_2/Screens/todos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});


  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();


  FirebaseFirestore db = FirebaseFirestore.instance;
  void addTodo(String title, String desc) async {
    final newTodo = <String, dynamic>{
      'title' : title,
      'desc' : desc
    };
    db.collection('todos').add(newTodo).then((DocumentReference doc) =>
        print("DocumentSnapshot added with ID: ${doc.id}"));
    titleController.clear();
    descController.clear();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Todos()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title'
              ),
            ),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: 'Desc'
              ),
            ),
            ElevatedButton(onPressed: () {
              addTodo(titleController.text, descController.text);
            }, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
