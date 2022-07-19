import 'package:books/domain/models/book.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final Book book;
  const BookCover(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 20),
      height: 250,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50),
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(book.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
