import 'package:books/presentation/books/AddUser.dart';
import 'package:books/presentation/books/ListBooks.dart';
import 'package:books/presentation/books/ListUsers.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> ListPages = [const ListBooks(), UserPage(), const ListUsers()];

    return ListPages[index];
  }
}
