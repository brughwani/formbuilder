import 'box_value.dart';

abstract class CheckBoxInterface {
  late int id;
  late String label;
  late List<BoxValue> boxValues;
}

class CheckBox implements CheckBoxInterface {
  @override
  int id;

  @override
  String label;

  @override
  List<BoxValue> boxValues;
  CheckBox({
    required this.id,
    required this.label,
    required this.boxValues,
  });
}
