import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final String text;
  final Function func;
  final bool busy, invert;

  LoadingButton({
    @required this.text,
    @required this.func,
    @required this.busy,
    @required this.invert
  });

  @override
  Widget build(BuildContext context) {
    return busy ?
        Container(
          alignment: Alignment.center,
          height: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ) :
        Container(
          margin: EdgeInsets.all(30),
          width: double.infinity,
          decoration: BoxDecoration(
              color: invert ? Theme.of(context).primaryColor : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60)
          ),
          height: 60,
          child: FlatButton(
            child: Text(
              text,
              style: TextStyle(
                color: invert ? Colors.white.withOpacity(0.8) : Theme.of(context).primaryColor,
                fontSize: 25,
                fontFamily: 'Big Shoulders Display',
              ),
            ),
            onPressed: func,
          ),
    );
  }
}
