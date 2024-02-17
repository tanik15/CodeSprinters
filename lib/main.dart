import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/bloc/home_screen_bloc.dart';
import 'package:portfolio/screens/buy_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/login_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenBloc>(
          create: (BuildContext context) => HomeScreenBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: screenWidth * 0.065,
                fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LogInScreen(),
        '/homeScreen': (context) => const HomeScreen(),

      },
    );
  }
}


// const [
            // FlSpot(0, 3),
            // FlSpot(2, 2),
            // FlSpot(4, 5),
            // FlSpot(6, 3.1),
            // FlSpot(8, 4),
            // FlSpot(9, 3),
            // FlSpot(10, 4),
            // FlSpot(12, 7),
            // FlSpot(14, 2),
            // FlSpot(16, 5),
            // FlSpot(18, 8),
            // FlSpot(20, 4),
            // FlSpot(22, 3),
            // FlSpot(24, 9),
            // FlSpot(26, 4),
            // FlSpot(28, 6),
            // FlSpot(30, 4),
          // ],