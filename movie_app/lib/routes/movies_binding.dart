import 'package:get/instance_manager.dart';
import 'package:movie_app/controller/movies_controller.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MoviesController());
  }
}
