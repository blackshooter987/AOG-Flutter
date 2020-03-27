import 'package:aog/widgets/submit-form.widget.dart';
import 'package:aog/widgets/sucess.widget.dart';
import 'package:aog/widgets/widget.logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  bool _busy = false, _completed = false;
  String _resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed ?
            Sucess(
              result: _resultText,
              reset: this.reset,
            ) :
            SubmitForm(
              gasCtrl: _gasCtrl,
              alcCtrl: _alcCtrl,
              busy: _busy,
              submitFunc: calculate,
            )
          ],
        ),
      ),
    );
  }

  Future calculate(){
    double alc = double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas = double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(
      const Duration(seconds: 1),
        (){
          setState(() {
            if(res >= 0.7){
              _resultText = "Compensa utilizar Gasolina!";
            }else{
              _resultText = "Compensa utilizar Álcool!";
            }

            _busy = false;
            _completed = true;
          });
        }
    );
  }

  void reset(){
    setState(() {
      _gasCtrl = new MoneyMaskedTextController();
      _alcCtrl = new MoneyMaskedTextController();
      _busy = _completed = false;
      _color = Colors.deepPurple;
    });
  }
}
