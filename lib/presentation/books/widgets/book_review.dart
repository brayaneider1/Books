import 'package:books/domain/models/book.dart';
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
              Text(
                "${book.score}",
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              _buildStart(),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: book.description,
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500)),
          ])),
        ],
      ),
    );
  }
}

Widget _buildStart() {
  final List<Color> color = [
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.amber,
    Colors.grey,
  ];

  return Row(
    children: color.map((e) => Icon(Icons.star, size: 25, color: e)).toList(),
  );
}
