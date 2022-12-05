import 'package:acadocen/UI/pages/course/course_list.dart';
import 'package:acadocen/UI/pages/pages.dart';
import 'package:acadocen/UI/ui.dart';
import 'package:acadocen/UI/widgets/background_loading.dart';

class AppRoutes {
  const AppRoutes._();
  static String loading = '/loading';
  static String login = '/login';

  static List<GetPage<dynamic>> get all {
    return [
      GetPage(
        name: '/home',
        page: () => const Home(currentTab: 0),
      ),
      GetPage(
        name: '/loading',
        page: () => const BackgroundLoading(),
      ),
      GetPage(
        name: '/login',
        page: () => const Login(),
      ),
      GetPage(
        name: '/qr',
        page: () => const QrStudent(),
      ),
      GetPage(
        name: '/courseList',
        page: () => const CourseList(),
      ),
    ];
  }
}
