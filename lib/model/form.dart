

import 'checkbox.dart';

abstract class FormInterface {
  late List<CheckBox> checkBoxes;
}

class Form implements FormInterface {
  @override
  List<CheckBox> checkBoxes;
  Form({
    required this.checkBoxes,
  });
}
