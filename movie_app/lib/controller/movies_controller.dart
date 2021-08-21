import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:movie_app/const/constants.dart';
import 'package:movie_app/models/movies_popular_dto.dart';
import 'package:movie_app/models/movies_top_rated_dto.dart';
import 'package:movie_app/repositories/movie_db_api.dart';

class MoviesController extends GetxController {
  MovieDbApi _movieDbApi = MovieDbApi();
  Rx<MoviesPopularDto> moviesPopular = MoviesPopularDto().obs;
  Rx<MoviesTopRatedDto> movieTopRated = MoviesTopRatedDto().obs;

  @override
  void onInit() {
    _loadMoviesPopular();
    _loadMoviesTopRated();
    super.onInit();
  }

  void _loadMoviesPopular() async {
    try {
      moviesPopular.value = await _movieDbApi.getMoviesPopular();
      moviesPopular.refresh();
    } catch (e) {
      _showDialog(title: "Error", middleText: "Cannot load data");
    }
  }

  void _loadMoviesTopRated() async {
    try {
      movieTopRated.value = await _movieDbApi.getMoviesTopRated();
      movieTopRated.refresh();
    } catch (e) {
      _showDialog(title: "Error", middleText: "Cannot load data");
    }
  }

  Widget loadMoviePosterWidget(int index) {
    return InkWell(
      onTap: () =>
          Get.toNamed('/details/${movieTopRated.value.results![index].id!}'),
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0, 4.0, 0),
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(
                BASE_IMAGE + movieTopRated.value.results ![index].posterPath!),
          ),
        ),
      ),
    );
  }

  Widget loadMovieBackdropWidget(int index) {
    return InkWell(
      onTap: () =>
          Get.toNamed('/details/${moviesPopular.value.results![index].id!}'),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Image(
                fit: BoxFit.fill,
                image: NetworkImage(BASE_IMAGE +
                    moviesPopular.value.results![index].backdropPath!),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0x0),
                      Color(0xff000000),
                    ],
                  ),
                ),
                child: Text(
                  moviesPopular.value.results![index].title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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