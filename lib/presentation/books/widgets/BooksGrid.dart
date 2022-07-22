import 'package:books/domain/models/book.dart';
import 'package:books/presentation/books/widgets/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BooksStaggeredGridView extends StatefulWidget {
  final List book;
  BooksStaggeredGridView(this.book, {Key? key}) : super(key: key);

  @override
  State<BooksStaggeredGridView> createState() => _BooksStaggeredGridViewState();
}

class _BooksStaggeredGridViewState extends State<BooksStaggeredGridView> {
/*   final bookList = Book.generateBooks();
 */
  @override
  Widget build(BuildContext context) {
    print('Grid book');
    print(widget.book);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 4,
          itemCount: widget.book.length,
          itemBuilder: (_, index) => BookItem(widget.book[index]),
          staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
        ));
  }
}

/* class FormsCO2EScreen extends StatefulWidget {
  double date1, date2, date3, date4, date5, date6, date7;
  FormsCO2EScreen(this.date1, this.date2, this.date3, this.date4, this.date5,
      this.date6, this.date7);

  @override
  _FormsCO2EScreenState createState() => _FormsCO2EScreenState();
}

class _FormsCO2EScreenState extends State<FormsCO2EScreen> { */