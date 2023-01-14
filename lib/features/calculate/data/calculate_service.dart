import 'package:test_golektruk/features/calculate/domain/calculate_model.dart';

class CalculateService {
  tambah({
    required CalculateModel calculateModel,
    required int inputNumber,
  }) {
    if (calculateModel.isChecked) {
      return calculateModel.value + inputNumber;
    }
  }

  kurang({
    required CalculateModel calculateModel,
    required int inputNumber,
  }) {
    if (calculateModel.isChecked) {
      return calculateModel.value - inputNumber;
    }
  }

  bagi({
    required CalculateModel calculateModel,
    required int inputNumber,
  }) {
    if (calculateModel.isChecked) {
      if (calculateModel.value != 0) {
        return calculateModel.value / inputNumber;
      }
    }
  }
}
