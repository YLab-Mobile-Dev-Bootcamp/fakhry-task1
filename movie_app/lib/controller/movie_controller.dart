import 'package:get/get.dart';
import 'package:movie_app/data/movie_model.dart';

class MovieController extends GetxController {
  RxList<Movie> movies = movieList.obs;
}
