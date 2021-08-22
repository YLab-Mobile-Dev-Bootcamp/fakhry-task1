import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/const/constants.dart';
import 'package:movie_app/controller/movie_details_controller.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  final MovieDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details of the Movie")),
      body: SingleChildScrollView(
        child: Obx(
          () => _controller.movieDetails.value.title == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
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
                              return _columnView();
                            } else if (constraint.maxWidth <= 1200) {
                              return _columnView();
                            } else {
                              return _columnView();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _columnView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    BASE_IMAGE + _controller.movieDetails.value.posterPath!,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Text(
                        _controller.movieDetails.value.title!,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Wrap(
                        children: [
                          Text(
                            'Release Date:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            _controller.movieDetails.value.releaseDate!.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrangeAccent,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            _controller.movieDetails.value.voteAverage.toString(),
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 50,
          thickness: 5,
        ),
        Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: ListTile(
            title: Text(
              "Overview",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              _controller.movieDetails.value.overview!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
