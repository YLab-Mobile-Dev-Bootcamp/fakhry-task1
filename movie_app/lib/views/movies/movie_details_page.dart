import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/const/constants.dart';
import 'package:movie_app/controller/movie_details_controller.dart';
import 'package:movie_app/themes/app_theme.dart';
import 'package:movie_app/themes/colors.dart';
import 'package:movie_app/themes/dimens.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  final MovieDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Obx(
                () => _controller.movieDetails.value.title == null
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
                                    return _bodyWidget(context);
                                  } else if (constraint.maxWidth <= 1400) {
                                    return _bodyWidget(context);
                                  } else {
                                    return _bodyWidget(context);
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
        ),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 2.4,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Image.network(
                BASE_IMAGE_ORIGINAL +
                    _controller.movieDetails.value.backdropPath!,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0x0),
                      Color(primaryBackground),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: regularSpace,
                left: regularSpace,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(grayTransparent50),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(primaryText),
                      size: extraLargeFontSize,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                regularSpace, smallSpace, regularSpace, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleWidget(),
                _releaseAndGenreWidget(),
                _overviewWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _titleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textWidget(
            _controller.movieDetails.value.title!, extraLargeFontSize, true),
        SizedBox(height: smallSpace),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.access_time_sharp,
              color: Color(primaryText),
              size: regularFontSize,
            ),
            SizedBox(width: miniSpace),
            _textWidget("${_controller.movieDetails.value.runtime!} minutes",
                regularFontSize, false),
            SizedBox(width: regularSpace),
            Icon(
              Icons.star,
              color: Color(selectableText),
              size: regularFontSize,
            ),
            _textWidget(
                "${_controller.movieDetails.value.voteAverage!} "
                "(${_controller.movieDetails.value.voteCount!})",
                regularFontSize,
                false),
          ],
        ),
        SizedBox(height: smallSpace),
        Divider(
          color: Color(whiteTransparent50),
        ),
      ],
    );
  }

  Widget _releaseAndGenreWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textWidget("Release Date", largeFontSize, true),
                  SizedBox(height: smallSpace),
                  _textWidget(_controller.movieDetails.value.releaseDate!,
                      regularFontSize, false)
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textWidget("Genres", largeFontSize, true),
                  SizedBox(height: smallSpace),
                  _textWidget(
                      _controller.movieDetails.value.genres!
                          .map((value) => value.name)
                          .toList()
                          .join(" • "),
                      regularFontSize,
                      false)
                ],
              ),
            )
          ],
        ),
        SizedBox(height: smallSpace),
        Divider(
          color: Color(whiteTransparent50),
        ),
      ],
    );
  }

  Widget _overviewWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: smallSpace),
        _textWidget("Overview", largeFontSize, true),
        SizedBox(height: smallSpace),
        _textWidget(
            _controller.movieDetails.value.overview!, regularFontSize, false),
        SizedBox(height: regularSpace),
      ],
    );
  }

  Widget _textWidget(String text, double size, bool isBold) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontSize: size,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: Color(primaryText)),
    );
  }
}
