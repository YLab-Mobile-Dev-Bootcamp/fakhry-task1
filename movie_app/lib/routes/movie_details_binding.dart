import 'package:get/instance_manager.dart';
import 'package:movie_app/controller/movie_details_controller.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController());
  }
}
