import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indeks Prestasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndeksPrestasiCalculator(),
    );
  }
}

class IndeksPrestasiCalculator extends StatefulWidget {
  @override
  _IndeksPrestasiCalculatorState createState() =>
      _IndeksPrestasiCalculatorState();
}

class _IndeksPrestasiCalculatorState extends State<IndeksPrestasiCalculator> {
  TextEditingController gradeController1 = TextEditingController();
  TextEditingController gradeController2 = TextEditingController();
  TextEditingController gradeController3 = TextEditingController();
  TextEditingController creditController1 = TextEditingController();
  TextEditingController creditController2 = TextEditingController();
  TextEditingController creditController3 = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Indeks Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: gradeController1,
              decoration: InputDecoration(labelText: 'Huruf Mutu 1'),
            ),
            TextFormField(
              controller: creditController1,
              decoration: InputDecoration(labelText: 'Kredit 1'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: gradeController2,
              decoration: InputDecoration(labelText: 'Huruf Mutu 2'),
            ),
            TextFormField(
              controller: creditController2,
              decoration: InputDecoration(labelText: 'Kredit 2'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: gradeController3,
              decoration: InputDecoration(labelText: 'Huruf Mutu 3'),
            ),
            TextFormField(
              controller: creditController3,
              decoration: InputDecoration(labelText: 'Kredit 3'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateResult();
              },
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text(
              'Indeks Prestasi: $result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void calculateResult() {
    double credit1 = double.tryParse(creditController1.text) ?? 0;
    double credit2 = double.tryParse(creditController2.text) ?? 0;
    double credit3 = double.tryParse(creditController3.text) ?? 0;
    double totalCredits = credit1 + credit2 + credit3;

    double gradeToNumber(String grade) {
      switch (grade) {
        case 'A':
          return 4.0;
        case 'AB':
          return 3.5;
        case 'B':
          return 3.0;
        case 'BC':
          return 2.5;
        case 'C':
          return 2.0;
        case 'CD':
          return 1.5;
        case 'D':
          return 1.0;
        case 'DE':
          return 0.5;
        case 'E':
          return 0.0;
        default:
          return 0.0;
      }
    }

    double grade1 = gradeToNumber(gradeController1.text);
    double grade2 = gradeToNumber(gradeController2.text);
    double grade3 = gradeToNumber(gradeController3.text);

    double totalGradeCredits =
        (grade1 * credit1) + (grade2 * credit2) + (grade3 * credit3);

    setState(() {
      result = totalGradeCredits / totalCredits;
    });
  }
}
