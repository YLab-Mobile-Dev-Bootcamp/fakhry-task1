import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_app/routes/movie_details_binding.dart';
import 'package:movie_app/routes/home_binding.dart';
import 'package:movie_app/views/movies/movie_details_page.dart';
import 'package:movie_app/views/home_page.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/movie/:movieId',
      page: () => MovieDetailsPage(),
      binding: MovieDetailsBinding(),
    ),
  ];
}
