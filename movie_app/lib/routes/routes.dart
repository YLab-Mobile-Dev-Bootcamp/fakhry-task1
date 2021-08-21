import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_app/routes/movies_binding.dart';
import 'package:movie_app/views/details_page.dart';
import 'package:movie_app/views/home_page.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: MoviesBinding(),
    ),
    GetPage(
      name: '/details/:movieId',
      page: () => DetailsPage(),
      binding: MoviesBinding(),
    ),
  ];
}
