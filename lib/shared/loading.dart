import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[900],
      child: Center(
        child: SpinKitSpinningLines(
          color: Colors.brown,
          size: 100,
          lineWidth: 3,
        ),
      ),
    );
  }
}