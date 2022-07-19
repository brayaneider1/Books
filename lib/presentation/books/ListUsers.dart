import 'package:books/domain/models/UserInfo.dart';
import 'package:books/presentation/books/widgets/AddBook/ButtonWidget.dart';
import 'package:books/presentation/books/widgets/ListUser/appbar_widget.dart';
import 'package:books/presentation/books/widgets/ListUser/numbers_widget.dart';
import 'package:books/presentation/books/widgets/ListUser/profile_widget.dart';
import 'package:books/utils/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String name = '';
  late String Age = '';
  late String email = '';
  late String phone = '';
  late DateTime? birthday = DateTime.now();

  @override
  void initState() {
    super.initState();

    name = UserSimplePreferences.getUsername() ?? '';
    Age = UserSimplePreferences.getAge() ?? '';
    email = UserSimplePreferences.getEmail() ?? '';
    phone = UserSimplePreferences.getPhone() ?? '';
    birthday = UserSimplePreferences.getBirthday() ?? DateTime.now();
  }

  late final user = User(
      imagePath:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
      name: name,
      email: email.toString() ?? '',
      phone: phone.toString() ?? '0000',
      Age: Age.toString() ?? '0',
      birthday: birthday.toString() ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          const SizedBox(height: 24),
          NumbersWidget(age: Age, birthday: birthday.toString().substring(0,10),),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.phone,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
