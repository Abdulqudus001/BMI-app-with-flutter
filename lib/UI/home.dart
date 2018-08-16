import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double _BMI = null;
  String result = 'Enter all metrics';
  String _BMICategory = '';
  void calculateBMI(){
    setState((){
      if(_ageController.text.toString().isNotEmpty && _heightController.text.toString().isNotEmpty && _weightController.text.toString().isNotEmpty){
        if(double.parse(_ageController.text) >= 20 && double.parse(_ageController.text)>0 && double.parse(_heightController.text)>0 && double.parse(_weightController.text)>0) {
          _BMI = double.parse(_weightController.text) / (double.parse(_heightController.text) * double.parse(_heightController.text));
          result = 'Your BMI is ${_BMI.toStringAsFixed(2)}';
          if(_BMI < 15)
            _BMICategory = ' Your BMI says you are very severely underweight';
          else if(_BMI > 14.9 && _BMI < 15.9)
            _BMICategory = 'Your BMI says you are severely underweight';
          else if(_BMI > 15.9 && _BMI < 18.4)
            _BMICategory = 'Your BMI says you are underweight';
          else if(_BMI > 18.4 && _BMI < 24.9)
            _BMICategory = 'Your BMI says you are normal (healthy weight)';
          else if(_BMI > 24.9 && _BMI < 29.9)
            _BMICategory = 'Your BMI says you are overweight';
          else if(_BMI > 29.9 && _BMI < 34.9)
            _BMICategory = 'Your BMI says you are moderately obese';
          else if(_BMI > 34.9 && _BMI < 39.9)
            _BMICategory = 'Your BMI says you are severely obese';
          else
            _BMICategory = 'Your BMI says you are very severely obese';
        }
        else if (double.parse(_ageController.text) < 20 && double.parse(_ageController.text)>0 && double.parse(_heightController.text)>0 && double.parse(_weightController.text)>0){
          result = 'No official metric for ages 20 and below';
          _BMICategory = 'No BMI available';
        }
      } else {
        result = 'Please fill all required fields';
        _BMICategory = 'No BMI available';
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text('BMI'),
          backgroundColor: Colors.purple.shade400,
        ),
        backgroundColor: Colors.grey.shade400,
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 80.0,
              width: 80.0,
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Container(
              margin: EdgeInsets.all(5.0),
              height: 300.0,
              width: 250.0,
              decoration: new BoxDecoration(
                  color: Colors.purple.shade200,
                  borderRadius: BorderRadius.circular(10.0)),
              child: new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(5.0)),
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: new Icon(Icons.person_outline),
                        hintText: 'Age',
                        labelText: 'Enter your age'),
                  ),
                  new Padding(padding: EdgeInsets.all(5.0)),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: new Icon(Icons.insert_chart),
                        hintText: 'Height',
                        labelText: 'Height in feet'),
                  ),
                  new Padding(padding: EdgeInsets.all(5.0)),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: new Icon(Icons.line_weight),
                        hintText: 'Weight',
                        labelText: 'Weight in lb'),
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new RaisedButton(
                    color: Colors.purple,
                    onPressed: calculateBMI,
                    child: new Text('Calculate',style: new TextStyle(fontSize: 18.0,color: Colors.white),),
                  )
                ],
              ),
            ),
            new Center(
              child: new Text(result,
                style: new TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                  color: result =='Enter all metrics'? Colors.red: Colors.purple.shade500,
                ),
              )
            ),
            new Center(
                child: new Text(_BMICategory,
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.purple.shade900,
                  ),
                )
            )
          ],
        ));
  }
}
