import 'package:books/domain/models/book2.dart';
import 'package:books/domain/services/GetBooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BooksProvider extends ChangeNotifier {
  late List<Book> listBook;
  late List<Book> SearchBook;
  late bool loadData = false;
  late String q = "tolkien";

  Future getListService(String q) async {
    setLoad(true);
    listBook = await BooksService.instance.getBooks(q);
    setLoad(false);
    notifyListeners();
  }

  Future setSearch(String search) async {
    q = search;
    await getListService(q);
    notifyListeners();
  }

  Future setLoad(bool loading) async {
    loadData = loading;
    notifyListeners();
  }
}
