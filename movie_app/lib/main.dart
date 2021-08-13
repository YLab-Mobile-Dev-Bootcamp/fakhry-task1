import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/bindings/movie_binding.dart';
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
      initialBinding: MovieBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}