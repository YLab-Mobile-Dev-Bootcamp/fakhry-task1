import 'package:get/instance_manager.dart';
import 'package:movie_app/controller/tv_show_details_controller.dart';

class TvShowDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TvShowDetailsController());
  }
}
