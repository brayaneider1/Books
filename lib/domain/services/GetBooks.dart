import 'dart:convert';
import 'package:books/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/book2.dart';

class BooksService {
  BooksService._internal();

  static BooksService _instance = BooksService._internal();
  static BooksService get instance => _instance;

  Future<List<Book>> getBooks(String searchValue) async {
    List<Book> books = List.empty();
    print('mmmmmm');
    print(searchValue);
    try {
      final response = await http.get(
        Uri.parse('http://openlibrary.org/search.json?q=${searchValue}'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ',
        },
      );

      List<dynamic> docs = jsonDecode(response.body)['docs'];

      books = docs.map<Book>((model) => Book.fromJson(model)).toList();
      return books;
    } catch (e) {
      print(e);
      return List.empty();
    }
  }
}
