import 'package:todo_list/modal/items.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody(
      {Key? key,
      required this.item,
      required this.removeTask,
      required this.index})
      : super(key: key);

  final DataItems item;
  final Function removeTask;
  final int index;

  bool _checkIndex(value) => (value % 2) == 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: _checkIndex(index) ? const Color(0xff999999) : Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              onTap: () {
                removeTask(item.id);
              },
              child: const Icon(
                Icons.delete_forever,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
