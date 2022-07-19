import 'dart:async';

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
  String ListB = "";
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isOffline = false;

  bool loadData = true;

  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Hay un error');
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        isOffline = false;
        loadCategory();

        break;
      case ConnectivityResult.mobile:
        isOffline = false;
        loadCategory();

        break;
      case ConnectivityResult.none:
        setState(() => isOffline = true);
        break;
      default:
        setState(() => isOffline = true);

        break;
    }
  }

  @override
  void loadCategory() async {
    await Provider.of<BooksProvider>(context, listen: false).getListService();
    ListB = Provider.of<BooksProvider>(context, listen: false).listBook;
    if (ListB == "") {
      loadData = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "$ListB",
          style: TextStyle(color: Color.fromARGB(255, 39, 38, 38)),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                  color: Color.fromARGB(255, 39, 38, 38),
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: BooksStaggeredGridView()),
         const SizedBox(height: 10,)
        ],
      ),
/*       bottomNavigationBar: _buildBottomNavigator(),
 */
    );
  }
}


/*   void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          break;
        case 1:
          _child = AccountContent();
          break;
        case 2:
          _child = SettingsContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
} */