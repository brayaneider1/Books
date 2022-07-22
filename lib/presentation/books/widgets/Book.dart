import 'package:books/domain/models/book2.dart';
import 'package:books/presentation/books/DetailBook.dart';
import 'package:books/presentation/books/widgets/Detail.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return book.isbn == null
        ? Container()
        : GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => BookDetail(book));
            },
            /* (() => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BookDetail(book)))), */
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://covers.openlibrary.org/b/isbn/${book.isbn![0]}.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)),
            ),
          );
  }
}
