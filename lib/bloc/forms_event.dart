part of 'forms_bloc.dart';

abstract class FormsEvent extends Equatable {
  const FormsEvent();

  @override
  List<Object> get props => [];
}

class LoadForm extends FormsEvent {}

class SaveForm extends FormsEvent {}

class UpdateCheckBoxLabel extends FormsEvent {
  final String label;
  const UpdateCheckBoxLabel({required this.label});
  @override
  List<Object> get props => [label];
}

class UpdateBoxValue extends FormsEvent {}

class AddBoxValue extends FormsEvent {
  final int checkBoxId;
  final BoxValue boxValue;
  const AddBoxValue({required this.checkBoxId, required this.boxValue});
  @override
  List<Object> get props => [checkBoxId, boxValue];
}

class SelectAnswerType extends FormsEvent {
  final AnswerType answerType;
  const SelectAnswerType(this.answerType);
  @override
  List<Object> get props => [answerType];
}

class AddCheckBox extends FormsEvent {
  final CheckBox checkBox;
  const AddCheckBox({
    required this.checkBox,
  });
}
