import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: FlareActor(
                'assets/success.flr',
                animation: 'success',
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Scan Absensi Berhasil!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

