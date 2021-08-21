import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:movie_app/models/movies_details_dto.dart';
import 'package:movie_app/repositories/movie_db_api.dart';

class MovieDetailsController extends GetxController {
  MovieDbApi _movieDbApi = MovieDbApi();
  Rx<MovieDetailsDto> movieDetails = MovieDetailsDto().obs;

  @override
  void onReady() {
    _loadMovieDetails();
    super.onReady();
  }

  void _loadMovieDetails() async {
    try {
      String? movieId = Get.parameters['movieId'];
      movieDetails.value = await _movieDbApi.getMovieDetails(movieId!);
      movieDetails.refresh();
    } catch (e) {
      _showDialog(title: "Error", middleText: "Cannot load data");
    }
  }

  void _closeCurrentDialog() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  void _showDialog({required String title, required String middleText}) {
    _closeCurrentDialog();
    Get.defaultDialog(
      barrierDismissible: false,
      titleStyle: TextStyle(fontSize: 24),
      middleTextStyle: TextStyle(fontSize: 18),
      title: title,
      middleText: middleText,
      textConfirm: 'OK',
      radius: 17,
      confirmTextColor: Colors.black87,
      onConfirm: () {
        Navigator.of(Get.overlayContext!).pop();
      },
    );
  }
}
