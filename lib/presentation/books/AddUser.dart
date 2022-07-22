/* import 'package:books/presentation/books/widgets/AddBook/AlertDialog.dart';
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

  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController mobileCtrl = new TextEditingController();

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
              Form(
                  child: Column(
                children: [
                  buildName(),
                  const SizedBox(height: 15),
                  buildLastName(),
                  const SizedBox(height: 15),
                  buildPhone(),
                  const SizedBox(height: 15),
                  buildEmail(),
                  const SizedBox(height: 15),
                ],
              )),
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
          controller: emailCtrl,
          validator: validateEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Your email',
          ),
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

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return '';
    }
  }

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
 */

import 'package:books/presentation/books/widgets/AddBook/AlertDialog.dart';
import 'package:books/presentation/books/widgets/AddBook/TitleWidget.dart';
import 'package:books/utils/user_preferences.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:books/presentation/books/widgets/AddBook/BirthdatWidget.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late DateTime? birthday = DateTime.now();
  late DateTime now = DateTime.now();
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  DateDuration? duration;
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    birthday = UserSimplePreferences.getBirthday() ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: keyForm,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: ListTile(leading: Icon(icon), title: item),
    );
  }

  String? gender = 'male';

  Widget formUI() {
    return Column(
      children: <Widget>[
        const TitleWidget(icon: Icons.person_add, text: 'Add User'),
        formItemsDesign(
            Icons.person,
            TextFormField(
              controller: nameCtrl,
              validator: validateName,
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: lastNameCtrl,
              decoration: const InputDecoration(
                labelText: 'Last name',
              ),
            )),
        formItemsDesign(
            Icons.phone,
            TextFormField(
              controller: mobileCtrl,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              validator: validateMobile,
            )),
        formItemsDesign(
            Icons.email,
            TextFormField(
              controller: emailCtrl,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 32,
              validator: validateEmail,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Container(
            child: Flexible(child: buildBirthday()),
          ),
        ),
        formItemsDesign(
            null,
            Column(children: <Widget>[
              const Text("Genre"),
              RadioListTile<String>(
                title: const Text('Male'),
                value: 'male',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Female'),
                value: 'female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              )
            ])),
        const SizedBox(height: 12),
        GestureDetector(
            onTap: () {
              save();
            },
            child: Container(
              margin: const EdgeInsets.all(30.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 87, 44, 167),
                  Colors.deepPurple.shade200,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: const Text("Guardar",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: const EdgeInsets.only(top: 16, bottom: 16),
            ))
      ],
    );
  }

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

  Widget buildBirthday() => buildTitle(
        title: 'Birthday',
        child: BirthdayWidget(
          birthday: birthday!,
          onChangedBirthday: (birthday) => setState(() => {
                duration = AgeCalculator.age(birthday),
                this.birthday = birthday
              }),
        ),
      );

  String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return "Nmae is required";
    } else if (!regExp.hasMatch(value!)) {
      return "Name required a-z y A-Z";
    }
    return null;
  }

  String? validateMobile(String? value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value?.length == 0) {
      return "Phone is required";
    } else if (value?.length != 10) {
      return "The number must have 10 digits";
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return "Mail is necessary";
    } else if (!regExp.hasMatch(value)) {
      return "Mail invalid";
    } else {
      return null;
    }
  }

  save() {
    if (keyForm.currentState!.validate()) {
/*       print("Nombre ${nameCtrl.text}");
      print("Telefono ${mobileCtrl.text}");
      print("Correo ${emailCtrl.text}");
/*       print(duration!.years);
 */ */

      return showMyDialog(context, nameCtrl.text, lastNameCtrl.text, birthday,
          duration!.years, emailCtrl.text, mobileCtrl.text);
      /*  await UserSimplePreferences.setUsername(name); */
/*         await UserSimplePreferences.setBirthday(birthday!);
 */

      keyForm.currentState!.reset();
    }
  }
}
