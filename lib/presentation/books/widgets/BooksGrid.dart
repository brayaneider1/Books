import 'package:books/domain/models/book.dart';
import 'package:books/presentation/books/widgets/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BooksStaggeredGridView extends StatelessWidget {
  final bookList = Book.generateBooks();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 4,
          itemCount: bookList.length,
          itemBuilder: (_, index) => BookItem(bookList[index]),
          staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
        ));
  }
}
