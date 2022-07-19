import 'package:books/domain/provider/BooksProvider.dart';
import 'package:books/presentation/books/ListBooks.dart';
import 'package:books/presentation/widgets/BottomNavigator.dart';
import 'package:books/presentation/widgets/Routes.dart';
import 'package:books/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserSimplePreferences().init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  BottomaBar? myBNB;

  @override
  void initState() {
    myBNB = BottomaBar((i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new BooksProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.light(),
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          accentColor: Colors.lightGreen.shade400,
          unselectedWidgetColor: Colors.deepPurple.shade200,
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            bottomNavigationBar: myBNB,
            body: SafeArea(
              bottom: false,
              child: Routes(index),
            )),
      ),
    );
  }
}
