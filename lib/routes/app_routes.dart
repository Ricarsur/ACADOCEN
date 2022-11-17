import 'package:acadocen/UI/pages/home/home_binding.dart';
import 'package:acadocen/UI/ui.dart';
import 'package:acadocen/UI/auth/login/login_binding.dart';

class AppRoutes {
  const AppRoutes._();
  static String login = '/login';

  static List<GetPage<dynamic>> get all {
    return [
      GetPage(
        name: '/home',
        page: () => const Home(),
        binding: const HomeBinding(),
      ),
      GetPage(
        name: '/login',
        page: () => const Login(),
        binding: const SignInBinding(),
      ),
    ];
  }
}
