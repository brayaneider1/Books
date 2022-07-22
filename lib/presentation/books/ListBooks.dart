import 'dart:async';

import 'package:books/domain/models/book2.dart';
import 'package:books/domain/provider/BooksProvider.dart';
import 'package:books/presentation/books/widgets/BooksGrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

class ListBooks extends StatefulWidget {
  const ListBooks({Key? key}) : super(key: key);

  @override
  State<ListBooks> createState() => _ListBooksState();
}

class _ListBooksState extends State<ListBooks> {
  List<Book> ListB = List.empty();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isOffline = false;

  bool loadData = true;

  final _searchController = TextEditingController(text: "tolkien");
  final styled = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic);
  @override
  void initState() {
    loadCategory("tolkien");
/*     initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus); */
    super.initState();
  }

  @override
  void loadCategory(String searchV) async {
    await Provider.of<BooksProvider>(context, listen: false)
        .getListService(searchV);
    ListB = Provider.of<BooksProvider>(context, listen: false).listBook;

    if (ListB == null) {
      setState(() {
        loadData = true;
      });
    } else {
      setState(() {
        loadData = false;
      });
    }
    print('In listBOOK');
    print(ListB);
/*     ListB.map((e) => print('BOOKmap'+e));
 */
  }

  @override
  Widget build(BuildContext context) {
    print(loadData);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Booky ",
          style: TextStyle(
              color: Color.fromARGB(255, 39, 38, 38),
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Search'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Serach for title or author',
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Search'),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              setState(() {
                                loadData = true;
                              });
                              loadCategory(_searchController.text);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.search,
                  size: 26.0,
                  color: Color.fromARGB(255, 39, 38, 38),
                ),
              )),
        ],
      ),
      body: loadData
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(child: BooksStaggeredGridView(ListB)),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
    );
  }
}
