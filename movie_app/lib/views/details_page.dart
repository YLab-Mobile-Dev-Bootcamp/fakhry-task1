import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/const/constants.dart';
import 'package:movie_app/controller/movie_controller.dart';
import 'package:movie_app/data/movie_model.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  late Movie movie;
  String? movieId = Get.parameters['movieId'];
  final MovieController _movieController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(Get.parameters['movieId']);
    movie = _movieController.movies[int.parse(movieId!)];
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
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
                        BASE_IMAGE + movie.poster,
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
                            movie.title,
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
                                movie.date,
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
                                movie.voteAvg.toString(),
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
                  movie.overview,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
