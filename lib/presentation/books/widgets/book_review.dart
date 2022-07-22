import 'package:books/domain/models/book2.dart';
import 'package:flutter/material.dart';

class BookReview extends StatelessWidget {
  final Book book;
  const BookReview(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: Text(
                    book.subjectFacet != null
                        ? book.subjectFacet![0].toString()
                        : "Lorem ipsum",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        fontSize: 26,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: book.firstSentence != null
                    ? book.firstSentence![0].toString()
                    : "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500)),
          ])),
        ],
      ),
    );
  }
}
