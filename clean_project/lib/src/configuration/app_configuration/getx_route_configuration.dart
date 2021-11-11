import 'package:clean_project/src/configuration/injection_configuration/injection_container.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';
import 'package:getx_presentation/screens/login/login_controller.dart';
import 'package:getx_presentation/screens/login/login_screen.dart';
import 'package:getx_presentation/screens/topics/topics_controller.dart';
import 'package:getx_presentation/screens/topics/topics_screen.dart';
import 'package:getx_presentation/screens/main/main_screen.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:get/get.dart';
import 'package:domain/use_cases/get_topics_use_case.dart';

class GetXRouteServiceImpl extends GetXRouteService {
  @override
  List<GetPage> generateRoutes() {
    List<GetPage> pages = [
      GetPage(
          name: GetXRouteName.loginScreen,
          page: () => GetXLoginScreen(
              LoginController(loginUseCase: getIt<LoginUseCase>()))),
      GetPage(
          name: GetXRouteName.topicsScreen,
          page: () => GetXTopicsScreen(
              TopicsController(getTopicsUseCase: getIt<GetTopicsUseCase>()))),
      GetPage(name: GetXRouteName.mainScreen, page: () => GetXMainScreen())
    ];
    return pages;
  }
}
