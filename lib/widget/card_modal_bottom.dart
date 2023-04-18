import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({super.key, required this.addTask});

  TextEditingController controller = TextEditingController();

  final Function addTask;

  void _handleAddTask(context) {
    if (controller.text.isEmpty) {
      return;
    }
    addTask(controller.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Your task'),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => _handleAddTask(context),
                    child: const Text('Add Task')))
          ],
        ),
      ),
    );
  }
}
