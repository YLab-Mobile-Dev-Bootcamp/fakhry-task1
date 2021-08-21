import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/movies_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final MoviesController _movieController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: _homeContainer(context)
    );
  }

  Widget _homeContainer(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 16.0),
          height: MediaQuery.of(context).size.height / 4,
          child: Obx(
                () =>
            _movieController.movieTopRated.value.results == null
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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
            child: Obx(
                  () =>
              _movieController.moviesPopular.value.results == null
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
