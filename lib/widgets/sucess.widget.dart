import 'package:flutter/material.dart';
import 'loading-button.widget.dart';

class Sucess extends StatelessWidget {
  final String result;
  final Function reset;

  Sucess({
    @required this.result,
    @required this.reset
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(0.8),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: 'Big Shoulders Display',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            text: 'Calcular Novamente',
            func: reset,
            busy: false,
            invert: true,
          ),
        ],
      ),
    );
  }
}
