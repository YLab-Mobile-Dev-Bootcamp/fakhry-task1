import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/routes/movies_binding.dart';
import 'package:movie_app/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: Routes.route,
      initialRoute: '/home',
      initialBinding: MoviesBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
