import 'package:acadocen/UI/ui.dart';

class AppRoutes {
  const AppRoutes._();
  static String login = '/login';

  static List<GetPage<dynamic>> get all {
    return [
      GetPage(
        name: '/home',
        page: () => const Home(),
      ),
      GetPage(
        name: '/login',
        page: () => const Login(),
      ),
    ];
  }
}
