import 'package:books/presentation/books/AddUser.dart';
import 'package:books/presentation/books/ListBooks.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class BottomaBar extends StatefulWidget {
  final Function currentIndex;
  BottomaBar(this.currentIndex, {Key? key}) : super(key: key);

  @override
  State<BottomaBar> createState() => _BottomaBarState();
}

class _BottomaBarState extends State<BottomaBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return FluidNavBar(
      icons: [
        FluidNavBarIcon(
            icon: Icons.book,
            backgroundColor: Color.fromARGB(255, 90, 31, 194),
            extras: {"label": "home"}),
        FluidNavBarIcon(
            icon: Icons.note_add_sharp,
            backgroundColor: Color.fromARGB(255, 90, 31, 194),
            extras: {"label": "account"}),
        FluidNavBarIcon(
            icon: Icons.group,
            backgroundColor: Color.fromARGB(255, 90, 31, 194),
            extras: {"label": "Users"}),
      ],
      onChange: (int i) {
        setState(() {
          index = 1;
          widget.currentIndex(i);
        });
      },
      style: FluidNavBarStyle(
          barBackgroundColor: Colors.grey[100],
          iconBackgroundColor: Color.fromARGB(58, 255, 255, 255),
          iconSelectedForegroundColor: Colors.white,
          iconUnselectedForegroundColor: Colors.white60),
      scaleFactor: 1,
      defaultIndex: 0,
      animationFactor: 1,
      itemBuilder: (icon, item) => Semantics(
        label: icon.extras!["label"],
        child: AnimatedSwitcher(
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          duration: Duration(milliseconds: 2000),
          child: item,
        ),
      ),
    );
  }
}
