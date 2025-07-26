import 'package:discover/core/functions/on_generate_route.dart';
import 'package:discover/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Discover());
}

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.readexProTextTheme()),
      initialRoute: MainView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
