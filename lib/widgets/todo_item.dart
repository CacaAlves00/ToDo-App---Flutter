import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';

class TodoItem extends StatefulWidget {
  final ToDo toDo;
  final Function onToDoItemDeleted;

  const TodoItem({
    super.key,
    required this.toDo,
    required this.onToDoItemDeleted,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          setState(() {
            widget.toDo.isDone = !widget.toDo.isDone;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        tileColor: Colors.white,
        leading: Icon(
          widget.toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          widget.toDo.todoText ?? '',
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: widget.toDo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              widget.onToDoItemDeleted(widget.toDo.id);
            },
          ),
        ),
      ),
    );
  }
}
