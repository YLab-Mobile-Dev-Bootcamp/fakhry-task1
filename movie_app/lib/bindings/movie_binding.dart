import 'package:get/get.dart';
import 'package:movie_app/controller/movie_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieController());
  }
}
