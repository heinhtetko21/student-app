// Flutter: Existing Libraries
import "package:flutter/material.dart";

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Pages
import './views/pages/home_page.dart';

// Controllers
import './controllers/student_controller.dart';

// Main: Index Function
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentController()),
      ],
      child: const MyApp(),
    ),
  );
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({super.key});

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return const MaterialApp(
      title: "Flutter Provider Tutorial",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
