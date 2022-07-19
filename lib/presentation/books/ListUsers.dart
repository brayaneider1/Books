import 'package:books/domain/provider/BooksProvider.dart';
import 'package:books/presentation/books/widgets/BooksGrid.dart';
import 'package:books/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  late String ListB = "";
  late String name = '';
  late String Age = '';
  late String email = '';
  late String phone = '';
  late DateTime? birthday = DateTime.now();
  bool loadData = true;

  @override
  void initState() {
    super.initState();

    name = UserSimplePreferences.getUsername() ?? '';
    Age = UserSimplePreferences.getAge() ?? '';
    email = UserSimplePreferences.getEmail() ?? '';
    phone = UserSimplePreferences.getPhone() ?? '';
    birthday = UserSimplePreferences.getBirthday() ?? DateTime.now();
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
          Expanded(
              child: Text(
            name,
            style: TextStyle(color: Colors.black87),
          )),
          Expanded(
              child: Text(
            birthday.toString().substring(0,10),
            style: TextStyle(color: Colors.black87),
          )),
          Expanded(
              child: Text(
            Age,
            style: TextStyle(color: Colors.black87),
          )),
          Expanded(
              child: Text(
            email,
            style: TextStyle(color: Colors.black87),
          )),
          Expanded(
              child: Text(
            phone,
            style: TextStyle(color: Colors.black87),
          )),

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