import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/auth/screens/login_screen_1.dart';
import 'package:amazon_clone_app/routers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Screens',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: ColorScheme.light(primary: GlobalVariables.secondaryColor),
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context)
            .textTheme
            .apply(
                displayColor: GlobalVariables.textColor,
                bodyColor: GlobalVariables.textColor)),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle:
                TextStyle(color: GlobalVariables.secondaryColor, fontSize: 18)),
        appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: GlobalVariables.textColor)),
        useMaterial3: false,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const loginscreen1(),
    );
  }
}
