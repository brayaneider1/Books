import 'package:flutter/material.dart';

Widget textFormField(BuildContext context, TextEditingController controler,
    TextInputType tipo, Color color, bool oscureText, String textLabel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Text(
          textLabel,
          style: const TextStyle(
              color: Color.fromARGB(255, 90, 31, 194),
              fontWeight: FontWeight.w400,
              fontSize: 16),
        ),
      ),
      SizedBox(height: 5),
      Padding(
          child: SizedBox(
            height: 38,
            child: TextFormField(
              controller: controler,

              obscureText: oscureText,
              style: (const TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.w400)),
              keyboardType: tipo,
              cursorColor: Colors.blueAccent,
              decoration: InputDecoration(
                  filled: true,
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  fillColor: color,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 90, 31, 194),
                      width: 2.0,
                    ),
                  )),
              // ignore: missing_return
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Campo Requerido';
                }
              },
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20))
    ],
  );
}
