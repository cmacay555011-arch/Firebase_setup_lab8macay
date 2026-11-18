import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String result = '';

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  void calculate(String operation) {
    final num1 = double.tryParse(num1Controller.text.trim());
    final num2 = double.tryParse(num2Controller.text.trim());

    if (num1 == null || num2 == null) {
      setState(() => result = 'Please enter valid numbers.');
      return;
    }

    double value;
    switch (operation) {
      case '+':
        value = num1 + num2;
        break;
      case '-':
        value = num1 - num2;
        break;
      case '*':
        value = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          setState(() => result = 'Cannot divide by zero.');
          return;
        }
        value = num1 / num2;
        break;
      default:
        return;
    }

    setState(() => result = value.toString());
  }

  void clear() {
    num1Controller.clear();
    num2Controller.clear();
    setState(() => result = '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            controller: num1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'First number',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: num2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Second number',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () => calculate('+'),
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () => calculate('-'),
                child: const Text('−'),
              ),
              ElevatedButton(
                onPressed: () => calculate('*'),
                child: const Text('×'),
              ),
              ElevatedButton(
                onPressed: () => calculate('/'),
                child: const Text('÷'),
              ),
              OutlinedButton(
                onPressed: clear,
                child: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Result: $result',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}