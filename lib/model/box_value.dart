abstract class BoxValueInterface {
  late int id;
  late bool isSelected;
  late String value;
}

class BoxValue implements BoxValueInterface {
  @override
  int id;

  @override
  bool isSelected;

  @override
  String value;

  BoxValue({
    required this.id,
    required this.isSelected,
    required this.value,
  });
}
