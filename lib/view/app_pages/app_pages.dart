import 'package:coral_interview_task/controller/splashscreen_controller/splashscreen_controller.dart';
import 'package:coral_interview_task/view/splash_screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static List<GetPage> appPages = <GetPage>[



GetPage(
  name: '/splashScreen',
  page: () => SplashScreen(),
  binding: SplashScreenControllerBinding(),
),

  ];
}