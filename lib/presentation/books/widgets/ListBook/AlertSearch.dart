import 'package:books/utils/user_preferences.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialogSearch(
  context,
) async {
  final _searchController = TextEditingController();
  const styled = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Registered user'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: '',
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
            },
          ),
        ],
      );
    },
  );
}
