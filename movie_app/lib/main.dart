import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Movie App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              height: MediaQuery.of(context).size.height / 4,
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
  final String baseImage = "https://image.tmdb.org/t/p/w500";
  final List<String> posterUrls = <String>[
    '/uHA5COgDzcxjpYSHHulrKVl6ByL.jpg',
    '/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
    '/34nDCQZwaEvsy4CFO5hkGRFDCVU.jpg',
    '/uHA5COgDzcxjpYSHHulrKVl6ByL.jpg',
    '/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
    '/34nDCQZwaEvsy4CFO5hkGRFDCVU.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: posterUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0, 4.0, 0),
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(baseImage + posterUrls[index]),
            ),
          ),
        );
      },
    );
  }
}

class _GridView extends StatelessWidget {
  final String baseImage = "https://image.tmdb.org/t/p/w500";
  final List<String> backdropUrls = <String>[
    '/tehpKMsls621GT9WUQie2Ft6LmP.jpg',
    '/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg',
    '/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg',
    '/tehpKMsls621GT9WUQie2Ft6LmP.jpg',
    '/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg',
    '/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg',
    '/tehpKMsls621GT9WUQie2Ft6LmP.jpg',
    '/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg',
    '/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg',
    '/tehpKMsls621GT9WUQie2Ft6LmP.jpg',
    '/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg',
    '/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg',
    '/tehpKMsls621GT9WUQie2Ft6LmP.jpg',
    '/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg',
    '/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg',
    '/tehpKMsls621GT9WUQie2Ft6LmP.jpg',
    '/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg',
    '/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg',
  ];

  final List<String> movieTitle = <String>[
    'The Forever Purge',
    'Black Widow',
    'The Tomorrow War',
    'The Forever Purge',
    'Black Widow',
    'The Tomorrow War',
    'The Forever Purge',
    'Black Widow',
    'The Tomorrow War',
    'The Forever Purge',
    'Black Widow',
    'The Tomorrow War',
    'The Forever Purge',
    'Black Widow',
    'The Tomorrow War',
    'The Forever Purge',
    'Black Widow',
    'The Tomorrow War',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 16 / 9,
      ),
      itemCount: backdropUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(baseImage + backdropUrls[index]),
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
                    movieTitle[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
