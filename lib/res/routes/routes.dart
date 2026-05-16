import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/home/home_view.dart';
import 'package:getx_mvvm/view/login/login_view.dart';
import 'package:getx_mvvm/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // jo v page bnayenge yha add krna hoga
  static appRoutes() => [
    GetPage(
      name: RoutesName.SplashScreen,
      page: () => SplashScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RoutesName.LoginView,
      page: () => LoginView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RoutesName.LoginView,
      page: () => HomeView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
