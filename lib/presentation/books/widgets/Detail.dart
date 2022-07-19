import 'package:books/domain/models/book.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Detail extends StatelessWidget {
  final Book book;
  const Detail(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.type.toUpperCase(),
            style: const TextStyle(color: Color.fromARGB(255, 255, 152, 7)),
          ),
          const SizedBox(height: 10),
          Text(
            book.name,
            style: const TextStyle(
                fontSize: 24, color: Colors.black87, height: 1.2),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(children: [
                const TextSpan(
                    text: 'Published from ',
                    style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: book.publisher,
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w500)),
              ])),
              Text(
                DateFormat.yMMMMd().format(book.date),
                style: const TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
