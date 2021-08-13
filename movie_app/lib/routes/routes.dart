import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_app/bindings/movie_binding.dart';
import 'package:movie_app/views/home_page.dart';
import 'package:movie_app/views/details_page.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: MovieBinding(),
    ),
    GetPage(
      name: '/details/:movieId',
      page: () => DetailsPage(),
      binding: MovieBinding(),
    ),
  ];
}
