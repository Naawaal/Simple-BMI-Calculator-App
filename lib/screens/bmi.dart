import 'package:bmi_calculator/widgets/app_input.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController weightController = TextEditingController();

  final TextEditingController heightController = TextEditingController();

  final TextEditingController inchController = TextEditingController();

  var result = "";
  var bgColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: bgColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _inputBuilder(weightController, heightController, inchController),
          const SizedBox(height: 20),
          _resultButton(
            () {
              var weight = weightController.text;
              var height = heightController.text;
              var inch = inchController.text;
              if (weight != "" || height != "" || inch != "") {
                var weightInt = int.parse(weight);
                var heightInt = int.parse(height);
                var fitInt = int.parse(inch);

                var totalInch = (fitInt * 12) + heightInt;
                var totalMeter = totalInch * 0.0254;
                var totalMeterSquare = totalMeter * totalMeter;
                var bmi = weightInt / totalMeterSquare;
                if (bmi > 25) {
                  bgColor = Colors.orange;
                } else if (bmi < 18.5) {
                  bgColor = Colors.red;
                } else {
                  bgColor = Colors.green;
                }

                setState(() {
                  result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                });
              } else {
                setState(() {
                  result = "Please enter your weight, height and inch";
                });
              }
            },
          ),
          const SizedBox(height: 20),
          Text(result),
        ],
      ),
    );
  }

//----------------------- _inputBuilder ---------------------//
  Widget _inputBuilder(weightController, heightController, fitController) {
    return Column(
      children: [
        AppInput(
          hintText: 'Enter your weight',
          controller: weightController,
          icons: const Icon(Icons.line_weight),
        ),
        AppInput(
          hintText: 'Enter your height',
          controller: fitController,
          icons: const Icon(Icons.height),
        ),
        AppInput(
          hintText: 'Enter your inch',
          controller: heightController,
          icons: const Icon(Icons.fitness_center),
        ),
      ],
    );
  }
}

Widget _resultButton(
  final Function()? onPressed,
) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(2),
    ),
    child: const Text('Calculate'),
  );
  //--------------------------------------------//
}
