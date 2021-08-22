import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/themes/app_theme.dart';
import 'package:movie_app/themes/colors.dart';
import 'package:movie_app/views/movies/movies_page.dart';
import 'package:movie_app/views/tv/tv_shows_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(primaryBackground),
          toolbarHeight: kMinInteractiveDimension,
          bottom: TabBar(
            controller: _tabController,
            labelColor: Color(selectableText),
            labelStyle: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
            indicatorColor: Color(selectableText),
            unselectedLabelColor: Color(primaryText),
            tabs: const <Widget>[
              Tab(
                text: "Movies",
              ),
              Tab(
                text: "Tv Shows",
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SafeArea(
                      child: MoviesPage(),
                    ),
                    SafeArea(
                      child: TvShowsPage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
