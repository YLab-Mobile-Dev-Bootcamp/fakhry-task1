import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/const/constants.dart';
import 'package:movie_app/models/tv_shows_dto.dart';
import 'package:movie_app/repositories/movie_db_api.dart';
import 'package:movie_app/themes/colors.dart';
import 'package:movie_app/themes/dimens.dart';

class TvShowsController extends GetxController {
  MovieDbApi _movieDbApi = MovieDbApi();
  Rx<TvShowsDto> tvShowTopRated = new TvShowsDto().obs;
  Rx<TvShowsDto> tvShowsPopular = new TvShowsDto().obs;

  @override
  void onInit() {
    _loadTvShowsTopRated();
    _loadTvShowsPopular();
    super.onInit();
  }

  void _loadTvShowsTopRated() async {
    try {
      tvShowTopRated.value = await _movieDbApi.getTvShowsTopRated();
      tvShowTopRated.refresh();
    } catch (e) {
      _showDialog(title: "Error", middleText: "Cannot load data");
    }
  }

  void _loadTvShowsPopular() async {
    try {
      tvShowsPopular.value = await _movieDbApi.getTvShowsPopular();
      tvShowsPopular.refresh();
    } catch (e) {
      _showDialog(title: "Error", middleText: "Cannot load data");
    }
  }

  Widget loadMoviePosterWidget(int index) {
    return InkWell(
      onTap: () =>
          Get.toNamed('/tv/${tvShowTopRated.value.results![index].id!}'),
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(
            miniSpace, noSpace, miniSpace, noSpace),
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(regularCornerRad),
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(
                BASE_IMAGE + tvShowTopRated.value.results![index].posterPath!),
          ),
        ),
      ),
    );
  }

  Widget loadMovieBackdropWidget(int index) {
    return InkWell(
      onTap: () =>
          Get.toNamed('/tv/${tvShowsPopular.value.results![index].id!}'),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(regularCornerRad),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Image(
                fit: BoxFit.fill,
                image: NetworkImage(tvShowsPopular
                            .value.results![index].backdropPath! ==
                        ""
                    ? "https://4.bp.blogspot.com/-paoOd6GtYpY/WIyQX9nNvGI/AAAAAAAABYs/50BdCcLhxC4VcUxzejMiqgiiS2dMWtixACPcB/s1600/error.png"
                    : BASE_IMAGE +
                        tvShowsPopular.value.results![index].backdropPath!),
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
                      tvShowsPopular.value.results![index].name!,
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
