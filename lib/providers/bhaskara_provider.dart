import 'package:flutter/foundation.dart';
import 'package:first_app_ueg_20261/logic/bhaskara_calculator.dart';

class BhaskaraProvider extends ChangeNotifier {
  final BhaskaraCalculator _calculator = BhaskaraCalculator();

  double? _a;
  double? _b;
  double? _c;

  BhaskaraResult? _result;
  String? _errorMessage;

  double? get a => _a;
  double? get b => _b;
  double? get c => _c;

  BhaskaraResult? get currentResult => _result;
  String? get currentError => _errorMessage;

  void setA(String value) {
    _a = double.tryParse(value);
    _clearResult();
  }

  void setB(String value) {
    _b = double.tryParse(value);
    _clearResult();
  }

  void setC(String value) {
    _c = double.tryParse(value);
    _clearResult();
  }

  void calculate() {
    _errorMessage = null;
    _result = null;

    if (_a == null || _b == null || _c == null) {
      _errorMessage = 'Por favor, preencha todos os coeficientes.';
      notifyListeners();
      return;
    }

    if (_a == 0) {
      _errorMessage = 'O coeficiente A não pode ser zero.';
      notifyListeners();
      return;
    }

    try {
      _result = _calculator.calculateRoots(_a!, _b!, _c!);
      if (!_result!.hasRealRoots) {
        _errorMessage =
            'A equação não possui raízes reais (Delta = ${_result!.discriminant}).';
      }
    } catch (e) {
      _errorMessage = 'Erro ao calcular: $e';
    }

    notifyListeners();
  }

  void reset() {
    _a = null;
    _b = null;
    _c = null;
    _result = null;
    _errorMessage = null;
    notifyListeners();
  }

  void _clearResult() {
    if (_result != null || _errorMessage != null) {
      _result = null;
      _errorMessage = null;
      notifyListeners();
    }
  }
}
