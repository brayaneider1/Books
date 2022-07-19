import 'package:books/domain/services/GetBooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BooksProvider extends ChangeNotifier {
  late String listBook;

  Future getListService() async {
    listBook = await BooksService.instance.getBooks();
    notifyListeners();
  }
}
