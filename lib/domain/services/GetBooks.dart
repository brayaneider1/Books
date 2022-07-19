import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksService {
  BooksService._internal();
  static BooksService _instance = BooksService._internal();
  static BooksService get instance => _instance;

  Future<String> getBooks() async {
    try {
      final response = await http.get(
        Uri.parse('http://openlibrary.org/search.json?q=tolkien'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ',
        },
      );

      print('entrando');
      print(response.body);
      return 'null';
    } catch (e) {
      print(e);
    }

    return 'null';
  }
}
