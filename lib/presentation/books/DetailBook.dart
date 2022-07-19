import 'package:books/presentation/books/widgets/Book_cover.dart';
import 'package:books/presentation/books/widgets/Detail.dart';
import 'package:books/presentation/books/widgets/book_review.dart';
import 'package:books/utils/MyNavigator.dart';
import 'package:flutter/material.dart';

import '../../domain/models/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        )),
        height: MediaQuery.of(context).size.height - 40,
        child: SingleChildScrollView(
          child: Column(
            children: [Detail(book), BookCover(book), BookReview(book)],
          ),
        ) /* ,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            )),
      ),
      body: */
        );
  }
}
