import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/controller/movies_controller.dart';
import 'package:movie_app/themes/dimens.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesController _movieController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: regularSpace, top: regularSpace),
          child: Text("Top Rated All Times",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: largeFontSize,
                color: Colors.white,
              )),
        ),
        Container(
          margin: EdgeInsets.only(bottom: regularSpace),
          height: MediaQuery.of(context).size.height / 4,
          child: Obx(
            () => _movieController.movieTopRated.value.results == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowGlow();
                      return true;
                    },
                    child: Scrollbar(
                      isAlwaysShown: GetPlatform.isWeb || GetPlatform.isDesktop
                          ? true
                          : false,
                      child: Center(
                        child: Container(
                          width: 1600,
                          child: LayoutBuilder(
                            builder: (context, constraint) {
                              if (constraint.maxWidth <= 600) {
                                return _listView();
                              } else if (constraint.maxWidth <= 1200) {
                                return _listView();
                              } else {
                                return _listView();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        Text(
          "Popular Movies",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: largeFontSize,
            color: Colors.white,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                smallSpace, regularSpace, smallSpace, regularSpace),
            child: Obx(
              () => _movieController.moviesPopular.value.results == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: Scrollbar(
                        isAlwaysShown:
                            GetPlatform.isWeb || GetPlatform.isDesktop
                                ? true
                                : false,
                        child: Center(
                          child: Container(
                            width: 1600,
                            child: LayoutBuilder(
                              builder: (context, constraint) {
                                if (constraint.maxWidth <= 600) {
                                  return _gridView(2);
                                } else if (constraint.maxWidth <= 1200) {
                                  return _gridView(3);
                                } else {
                                  return _gridView(4);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _listView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _movieController.movieTopRated.value.results!.length,
      itemBuilder: (BuildContext context, int index) {
        return _movieController.loadMoviePosterWidget(index);
      },
    );
  }

  Widget _gridView(int crossAxisCounter) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCounter,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 16 / 9,
      ),
      itemCount: _movieController.moviesPopular.value.results!.length,
      itemBuilder: (BuildContext context, int index) {
        return _movieController.loadMovieBackdropWidget(index);
      },
    );
  }
}
