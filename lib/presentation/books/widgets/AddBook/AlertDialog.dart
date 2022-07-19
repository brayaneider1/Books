import 'package:books/utils/user_preferences.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog(
    context, Name, LastName, Birthday, Age, email, phone) async {
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
              Container(
                height: 100,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2016/02/17/15/37/laptop-1205256_960_720.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15)),
              ),
              Text(
                'Name: ${Name}',
                style: styled,
                textAlign: TextAlign.left,
              ),
              Text(
                'LastName: ${LastName}',
                style: styled,
              ),
              Text(
                'Birthday: ${Birthday!.toString().substring(0, 10)}',
                style: styled,
              ),
              Text(
                'Age: ${Age.toString()}',
                style: styled,
              ),
              Text(
                'Email: ${email.toString()}',
                style: styled,
              ),
              Text(
                'Phone: ${phone.toString()}',
                style: styled,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () async {
              await UserSimplePreferences.setUsername(Name, LastName);
              await UserSimplePreferences.setEmail(email.toString());
              await UserSimplePreferences.setPhone(phone.toString());
              await UserSimplePreferences.setAge(Age.toString());
              await UserSimplePreferences.setBirthday(Birthday);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
