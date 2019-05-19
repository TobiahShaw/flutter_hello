import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.black,
                  ),
                  child: Stepper(
                    currentStep: _currentStep,
                    onStepTapped: (value) {
                      setState(() {
                        _currentStep = value; 
                      });
                    },
                    onStepContinue: () {
                      setState(() {
                        if(_currentStep < 2) _currentStep += 1; 
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                       if(_currentStep > 0) _currentStep -= 1;  
                      });
                    },
                    steps: [
                      Step(
                        title: Text('Login'),
                        subtitle: Text('Login first'),
                        content: Text('Aliqua ipsum enim officia deserunt reprehenderit dolor irure magna fugiat magna id amet sunt nisi.'),
                        isActive: _currentStep == 0,
                      ),
                      Step(
                        title: Text('Choose Plan'),
                        subtitle: Text('Choose your plan'),
                        content: Text('Aliqua ipsum enim officia deserunt reprehenderit dolor irure magna fugiat magna id amet sunt nisi.'),
                        isActive: _currentStep == 1,
                      ),
                      Step(
                        title: Text('Confirm Payment'),
                        subtitle: Text('Confirm your payment method'),
                        content: Text('Aliqua ipsum enim officia deserunt reprehenderit dolor irure magna fugiat magna id amet sunt nisi.'),
                        isActive: _currentStep == 2,
                      )
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}