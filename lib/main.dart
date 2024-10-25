
import 'package:coral_interview_task/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';



Future<void> main() async {
     WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}