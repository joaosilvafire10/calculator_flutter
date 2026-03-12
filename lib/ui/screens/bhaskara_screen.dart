import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app_ueg_20261/providers/bhaskara_provider.dart';

class BhaskaraScreen extends StatelessWidget {
  const BhaskaraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BhaskaraProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Fórmula de Bhaskara')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: _BhaskaraBody(),
        ),
      ),
    );
  }
}

class _BhaskaraBody extends StatelessWidget {
  const _BhaskaraBody();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BhaskaraProvider>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Ax² + Bx + C = 0',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _CoefficientInput(label: 'A', onChanged: provider.setA),
          const SizedBox(height: 16),
          _CoefficientInput(label: 'B', onChanged: provider.setB),
          const SizedBox(height: 16),
          _CoefficientInput(label: 'C', onChanged: provider.setC),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: provider.calculate,
            child: const Text('Calcular'),
          ),
          const SizedBox(height: 32),
          if (provider.currentError != null)
            Text(
              provider.currentError!,
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            )
          else if (provider.currentResult != null)
            _ResultDisplay(result: provider.currentResult),
        ],
      ),
    );
  }
}

class _CoefficientInput extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const _CoefficientInput({required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Coeficiente $label',
        border: const OutlineInputBorder(),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      onChanged: onChanged,
    );
  }
}

class _ResultDisplay extends StatelessWidget {
  final dynamic result;

  const _ResultDisplay({required this.result});

  @override
  Widget build(BuildContext context) {
    if (result == null) return const SizedBox.shrink();

    return Column(
      children: [
        Text(
          'Delta (Δ) = ${result.discriminant.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        if (result.hasRealRoots) ...[
          Text(
            'X1 = ${result.root1?.toStringAsFixed(2) ?? "N/A"}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'X2 = ${result.root2?.toStringAsFixed(2) ?? "N/A"}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ],
    );
  }
}
