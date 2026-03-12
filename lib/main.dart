import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/calculator/domain/operations_registry.dart';
import 'src/calculator/domain/operations/addition.dart';
import 'src/calculator/domain/operations/subtraction.dart';
import 'src/calculator/domain/operations/multiplication.dart';
import 'src/calculator/domain/operations/division.dart';
import 'src/calculator/domain/operations/sqrt.dart';
import 'src/calculator/logic/calculator_engine.dart';
import 'src/calculator/presentation/calculator_screen.dart';

void main() {
  final registry = OperationsRegistry()
    ..register(AdditionOperation())
    ..register(SubtractionOperation())
    ..register(MultiplicationOperation())
    ..register(DivisionOperation())
    ..register(SqrtOperation());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: registry),
        ChangeNotifierProvider(create: (_) => CalculatorEngine()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Extensible Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}
