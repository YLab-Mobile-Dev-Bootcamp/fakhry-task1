import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/const/constants.dart';
import 'package:movie_app/models/movies_dto.dart';
import 'package:movie_app/repositories/movie_db_api.dart';
import 'package:movie_app/themes/colors.dart';
import 'package:movie_app/themes/dimens.dart';

class MoviesController extends GetxController {
  MovieDbApi _movieDbApi = MovieDbApi();
  Rx<MoviesDto> moviesPopular = new MoviesDto().obs;
  Rx<MoviesDto> movieTopRated = new MoviesDto().obs;

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
          Get.toNamed('/movie/${movieTopRated.value.results![index].id!}'),
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(
            miniSpace, noSpace, miniSpace, noSpace),
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(regularCornerRad),
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(
                BASE_IMAGE + movieTopRated.value.results![index].posterPath!),
          ),
        ),
      ),
    );
  }

  Widget loadMovieBackdropWidget(int index) {
    return InkWell(
      onTap: () =>
          Get.toNamed('/movie/${moviesPopular.value.results![index].id!}'),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(regularCornerRad),
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
                        Color(transparent),
                        Color(black),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: miniSpace),
                    child: Text(
                      moviesPopular.value.results![index].title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.normal,
                        fontSize: regularFontSize,
                        color: Colors.white,
                      ),
                    ),
                  )),
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
      titleStyle: TextStyle(fontSize: largeFontSize),
      middleTextStyle: TextStyle(fontSize: regularFontSize),
      title: title,
      middleText: middleText,
      textConfirm: 'OK',
      radius: regularCornerRad,
      confirmTextColor: Color(selectableText),
      onConfirm: () {
        Navigator.of(Get.overlayContext!).pop();
      },
    );
  }
}
