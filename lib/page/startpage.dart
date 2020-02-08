import 'dart:typed_data';
import 'package:flutter_svg/flutter_svg.dart';
import 'scanpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class StartPage extends StatefulWidget{
  @override
  _StartPageState createState() => _StartPageState();

}

class _StartPageState extends State<StartPage> {
  final String back = 'assets/hoome.svg';

  get scanner => null;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            FlareActor(
              'assets/house2.flr',
              fit: BoxFit.cover,
              animation: 'Demo Mode',
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text("BukTam",style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins-Bold",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
//                  FlareActor(
//                    'assets/Success Check.flr',
//                    animation: 'Untitled'
//                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: SvgPicture.asset(back,),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScanPage()),
                      );
                    },
                    child: Text("Scan sekarang!"),
                    color: Colors.white70,
                    textColor: Colors.grey[900],
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  ),
//              MaterialButton(onPressed: _generateBarCode, child: Text("Data Tamu"),
//              color: Colors.yellowAccent,
//              splashColor: Colors.yellow,
//              minWidth: 150,
//              elevation: 8,
//              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


