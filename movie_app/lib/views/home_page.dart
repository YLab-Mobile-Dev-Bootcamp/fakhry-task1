import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/const/constants.dart';
import 'package:movie_app/controller/movie_controller.dart';
import 'dart:developer' as developer;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 4,
              child: _ListView()),
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
              child: _GridView(),
            ),
          ),
        ],
      ),
    );
  }
}


class _ListView extends StatelessWidget {
  final MovieController _movieController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _movieController.movies.length,
      itemBuilder: (BuildContext context, int index) {
        var movie = _movieController.movies[index];
        return InkWell(
          onTap: () => Get.toNamed('/details/$index'),
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0, 4.0, 0),
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(BASE_IMAGE + movie.poster),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GridView extends StatelessWidget {
  final MovieController _movieController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 16 / 9,
      ),
      itemCount: _movieController.movies.length,
      itemBuilder: (BuildContext context, int index) {
        var movie = _movieController.movies[index];
        return InkWell(
          onTap: () =>  Get.toNamed('/details/$index'),
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(BASE_IMAGE + movie.backdrop),
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
                      movie.title,
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
      },
    );
  }
}

