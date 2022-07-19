import 'package:books/domain/models/book.dart';
import 'package:books/presentation/books/DetailBook.dart';
import 'package:books/presentation/books/widgets/Detail.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => BookDetail(book));
      },
      child: Container(
        height: book.height as double,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(book.imgUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
