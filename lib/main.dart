import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Calc createState() => Calc();
}

class Calc extends State<MyHomePage> {
  String results="";
  final TextEditingController age = TextEditingController();
  final TextEditingController heightC = TextEditingController();
  final TextEditingController weightC = TextEditingController();
  String gender = 'Male';
  void calculate(double height, double weight){
    double result= weight/((height/100)*(height/100));
    String bmi=result.toStringAsFixed(3);
    setState(() {
      results=bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),

      ),

      body: Column(

        children: [

       Text("Enter Gender:"),
          DropdownButton<String>(
      value: gender,

        elevation: 16,

        underline: Container(
          height: 2,

        ),
        onChanged: (String? newValue) {
          setState(() {
            gender = newValue!;
          });
        },
        items: <String>['Male', 'Female']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
          // The user will type something here
          Text(""),Text(""),
          Text("Enter Age: "),
          TextField(
            controller: age,
            textAlign: TextAlign.center,
          ),Text(""),Text(""),
          Text("Enter height(cm):"),
          TextField(
            controller: heightC,
            textAlign: TextAlign.center,
          ),
          Text(""),Text(""),Text(""),
          Text("Enter weight (kg):"),
          TextField(
            controller: weightC,
            textAlign: TextAlign.center,

          ),
          Text(""),Text(""),
          ElevatedButton(

              onPressed: () {
                double height=double.parse(heightC.value.text);
                double weight=double.parse(weightC.value.text);
                calculate(height,weight);
              },
              child: const Text('Calculate')),

          // add some space
          const SizedBox(height: 40),

          // Display the result
          Text("The BMI is: "),
          Text(
            "$results",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),
          ),
          Text(""),Text(""),Text(""),
          Text(
            "BMI<18.50 is Underweight",
          ),
          Text(
            "18.50<BMI<24.99 is Healthy Weight",),
          Text(
            "25.00<BMI<29.99 is Overweight",
          ),
          Text(
            "BMI>30 is Overweight",
          ),
        ],
      ),
    );
  }
}