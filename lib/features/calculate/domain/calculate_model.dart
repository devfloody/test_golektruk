import 'dart:convert';

class CalculateModel {
  final double value;
  final bool? isChecked;

  CalculateModel({
    required this.value,
    required this.isChecked,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'isChecked': isChecked,
    };
  }

  factory CalculateModel.fromMap(Map<String, dynamic> map) {
    return CalculateModel(
      value: double.tryParse(map['value']) ?? 0,
      isChecked: map['isChecked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CalculateModel.fromJson(String source) =>
      CalculateModel.fromMap(json.decode(source));

  @override
  String toString() => 'CalculateModel(value: $value, isChecked: $isChecked)';

  CalculateModel copyWith({
    double? value,
    bool? isChecked,
  }) {
    return CalculateModel(
      value: value ?? this.value,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
