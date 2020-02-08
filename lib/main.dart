import 'dart:async';
import 'package:flutter/material.dart';
import 'page/startpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor:Colors.blue,
    accentColor: Colors.blueAccent,
  ),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
));

class SplashScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StartPage()));
  }
  final String assetName = 'assets/hoome.svg';

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        body: Stack(
          children: <Widget>[
            FlareActor(
              'assets/house.flr',
              fit: BoxFit.cover,
              animation: 'Demo Mode',
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width - 256.0),
//              padding: EdgeInsets.all(0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'BukTam',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32.0
                      ),
                    ),
                    SizedBox(height: 64.0),
                    CircularProgressIndicator(),
                    SizedBox(height: 16.0),
                    Text(
                      'GEN 15 RPL',
                      style: TextStyle(
                        color: Colors.white54
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }
