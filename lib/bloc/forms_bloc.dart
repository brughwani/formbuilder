import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dynamicapp/model/box_value.dart';
import 'package:dynamicapp/model/checkbox.dart';

import '../model/form.dart';

part 'forms_event.dart';
part 'forms_state.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(const FormsState()) {
    on<LoadForm>(_onLoadForm);
    on<SaveForm>(_onSaveForm);
    on<UpdateCheckBoxLabel>(_onUpdateCheckBoxFormLabel);
    on<UpdateBoxValue>(_onUpdateCheckBoxValue);
    on<AddBoxValue>(_onAddBoxValue);
    on<SelectAnswerType>(_onSelectAnswerType);
    on<AddCheckBox>(_onAddCheckBox);
  }

  void _onLoadForm(LoadForm event, Emitter<FormsState> emit) {
    emit(state.copyWith(status: FormStatus.loading));
  }

  void _onSaveForm(SaveForm event, Emitter<FormsState> emit) {
    emit(state.copyWith(status: FormStatus.saving));
  }

  void _onUpdateCheckBoxFormLabel(
      UpdateCheckBoxLabel event, Emitter<FormsState> emit) {
    emit(state.copyWith(status: FormStatus.loaded));
  }

  void _onUpdateCheckBoxValue(UpdateBoxValue event, Emitter<FormsState> emit) {
    emit(state.copyWith(status: FormStatus.loaded));
  }

  void _onAddBoxValue(AddBoxValue event, Emitter<FormsState> emit) {
    ///loop over the checkboxes and get the checkbox with the id
    CheckBox checkBox = state.form!.checkBoxes.firstWhere(
        (checkBox) => checkBox.id == event.checkBoxId);
    ///add the box value to the checkbox
    checkBox.boxValues.add(event.boxValue);
    /// replace the checkbox in the form with the new checkbox
    state.form!.checkBoxes.replaceRange(
        state.form!.checkBoxes.indexOf(checkBox), 1, [checkBox]);
    // emit the new state
    emit(state.copyWith(status: FormStatus.loaded));
  }

  void _onSelectAnswerType(SelectAnswerType event, Emitter<FormsState> emit) {
    emit(
      state.copyWith(
        answerType: event.answerType,
      ),
    );
  }

  void _onAddCheckBox(AddCheckBox event, Emitter<FormsState> emit) {
    if (state.form == null) {
      emit(
        state.copyWith(
          form: Form(
            checkBoxes: [event.checkBox],
          ),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        form: Form(
          checkBoxes: [...state.form!.checkBoxes,event.checkBox],
        ),
      ),
    );
  }
}
