import 'dart:js';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todoapp/Home_view/create_todo.dart';
import 'package:todoapp/Home_view/utils.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:todoapp/Share_Todo_tile/todo_tile_widget.dart';
import 'package:todoapp/Home_view/create_todo.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  int count = 0;
  void callback() {
    setState(() {
      count = count + 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: custColor(date: 'appbarColor'),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              return const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_img.jpg'),
                radius: 25,
                backgroundColor: Colors.amber,
              );
            }),
          ),
          title: const Text('My Task'),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu),
            ),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Todo_tile_wedge();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemCount: 10),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CreateTodo();
            }));
          },
          child: const Icon(Icons.add),
          backgroundColor: custColor(date: 'appbarColor'),
        ),
        bottomNavigationBar: SafeArea(
          child: InkWell(
            onTap: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return Todo_tile_wedge();
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        itemCount: 3);
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: custColor(date: 'appbarColor'),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(children: const [
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      'complete',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '2',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ])),
            ),
          ),
        ));
  }
}
