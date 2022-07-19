import 'package:books/presentation/books/widgets/AddBook/AlertDialog.dart';
import 'package:books/presentation/books/widgets/AddBook/BirthdatWidget.dart';
import 'package:books/presentation/books/widgets/AddBook/ButtonWidget.dart';
import 'package:books/presentation/books/widgets/AddBook/TitleWidget.dart';
import 'package:books/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator/age_calculator.dart';

class UserPage extends StatefulWidget {
  UserPage({
    Key? key,
  }) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final formKey = GlobalKey<FormState>();
  late String name = '';
  late String lastnames = '';
  late int age = 0;
  late String email = '';
  late String phone = '';
  late String genre = '';
  late DateTime? birthday = DateTime.now();
  late DateTime now = DateTime.now();

  DateDuration? duration;

  // Current time - at this moment
  DateTime today = DateTime.now();

  // Parsed date to check
  // Find out your age as of today's date 2021-03-08

  @override
  void initState() {
    super.initState();

    name = UserSimplePreferences.getUsername() ?? '';
    birthday = UserSimplePreferences.getBirthday() ?? DateTime.now();
    print(duration?.years);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TitleWidget(icon: Icons.person_add, text: 'Add User'),
              const SizedBox(height: 15),
              buildName(),
              const SizedBox(height: 15),
              buildLastName(),
              const SizedBox(height: 15),
              buildPhone(),
              const SizedBox(height: 15),
              buildEmail(),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: buildBirthday()),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    ' Age:   ${duration?.years ?? '0'}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              buildButton(),
            ],
          ),
        ),
      );

  Widget buildName() => buildTitle(
        title: 'Name',
        child: TextFormField(
          initialValue: name,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Your Name',
          ),
          onChanged: (name) => setState(() => this.name = name),
        ),
      );
  Widget buildLastName() => buildTitle(
        title: 'Last Names',
        child: TextFormField(
          initialValue: lastnames,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Your last name',
          ),
          onChanged: (lastnames) => setState(() => this.lastnames = lastnames),
        ),
      );
  Widget buildPhone() => buildTitle(
        title: 'Phone',
        child: TextFormField(
          initialValue: phone,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Your phone',
          ),
          onChanged: (phone) => setState(() => this.phone = phone),
        ),
      );
  Widget buildEmail() => buildTitle(
        title: 'Email',
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          initialValue: email,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Your email',
          ),
          onChanged: (email) => setState(() => this.email = email),
        ),
      );

  Widget buildBirthday() => buildTitle(
        title: 'Birthday',
        child: BirthdayWidget(
          birthday: birthday!,
          onChangedBirthday: (birthday) => setState(() => {
                duration = AgeCalculator.age(birthday!),
                this.birthday = birthday
              }),
        ),
      );

  Widget buildButton() => ButtonWidget(
      text: 'Save',
      onClicked: () async {
        showMyDialog(
            context, name, lastnames, birthday, duration?.years, email, phone);
        /*  await UserSimplePreferences.setUsername(name); */
/*         await UserSimplePreferences.setBirthday(birthday!);
 */
      });

  Widget buildTitle({
    required String title,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}
