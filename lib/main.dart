import 'package:todo_list/modal/items.dart';
import 'package:todo_list/widget/card_body_widget.dart';
import 'package:todo_list/widget/card_modal_bottom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];

  void _handleAddTask(String name) {
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleRemoveTask(String id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure delete?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              setState(() {
                items.removeWhere((element) => element.id == id);
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            children: items
                .map((item) => CardBody(
                    item: item,
                    removeTask: _handleRemoveTask,
                    index: items.indexOf(item)))
                .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return ModalBottom(addTask: _handleAddTask);
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
