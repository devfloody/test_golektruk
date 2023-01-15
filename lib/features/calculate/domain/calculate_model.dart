class CalculateModel {
  final double? value;
  final bool? isChecked;

  CalculateModel({
    this.value,
    this.isChecked,
  });

  CalculateModel copyWith({
    double? value,
    bool? isChecked,
  }) {
    return CalculateModel(
      value: value ?? this.value,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  String toString() => 'CalculateModel(value: $value, isChecked: $isChecked)';
}
