part of 'forms_bloc.dart';

enum FormStatus {
  loading,
  loaded,
  saving,
  saved,
}

enum AnswerType {
  none('none'),
  checkbox('Check Box'),
  dropdown('Dropdown');

  const AnswerType(this.value);
  final String value;
}

class FormsState extends Equatable {
  final Form? form;
  final FormStatus status;
  final AnswerType answerType;
  const FormsState({
    this.form,
     this.status = FormStatus.loading,
     this.answerType = AnswerType.none,
  });
  
  @override
  List<Object?> get props => [form, status, answerType];


  FormsState copyWith({
    Form? form,
    FormStatus? status,
    AnswerType? answerType,
  }) {
    return FormsState(
      form: form ?? this.form,
      status: status ?? this.status,
      answerType: answerType ?? this.answerType,
    );
  }
}
