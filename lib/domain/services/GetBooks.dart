import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksService {
  BooksService._internal();
  static BooksService _instance = BooksService._internal();
  static BooksService get instance => _instance;

  /*
   This is an asynchronous type method that receives as a parameter the token, 
   and through a get method, it communicates with the API, and it returns a list of objects,
   these objects are categories list of services
    */

  Future<String> getBooks() async {
    final response = await http.get(
      Uri.parse('http://openlibrary.org/search.json?author=tolkien'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ',
      },
    );

    // ServiceModel x = new ServiceModel();
    print('entrando');
    print(response.body);
    return 'null';
/*     ServiceModel x = new ServiceModel();
    if (response.statusCode == 200) {
      List<ServiceModel> aux = [];
      List data = jsonDecode(response.body);

      for (var i = 0; i < data.length; i++) {
        ServiceModel stData = new ServiceModel();
        stData = x.fromJson(data[i]);
        aux.add(stData);
      }
      return aux;
    } else {
      throw Exception('Failed to load service');
    } */
  }
}
