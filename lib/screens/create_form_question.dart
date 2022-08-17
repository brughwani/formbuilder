import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamicapp/bloc/forms_bloc.dart';
import 'package:dynamicapp/model/box_value.dart';
import 'package:dynamicapp/model/checkbox.dart';

class CreateFormQuestion extends StatefulWidget {
  const CreateFormQuestion({super.key});

  @override
  State<CreateFormQuestion> createState() => _CreateFormQuestionState();
}

class _CreateFormQuestionState extends State<CreateFormQuestion> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormsBloc, FormsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children: [
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 89),
                  const Center(
                    child: Text(
                      'Select Field Type',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      /// add radio buttons one for checkbox
                      Row(
                        children: [
                          Radio(
                            value: AnswerType.checkbox,
                            activeColor: Colors.lightBlue,
                            groupValue: state.answerType,
                            onChanged: (value) {
                              context.read<FormsBloc>().add(
                                    const SelectAnswerType(AnswerType.checkbox),
                                  );
                              context.read<FormsBloc>().add(AddCheckBox(
                                      checkBox: CheckBox(
                                          id: 1,
                                          label: '',
                                          boxValues: [
                                        BoxValue(
                                            id: 1,
                                            isSelected: true,
                                            value: "Yes")
                                      ])));
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(AnswerType.checkbox.value,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: state.answerType.value ==
                                          AnswerType.checkbox.value
                                      ? Colors.lightBlue
                                      : Colors.black)),
                        ],
                      ),

                      /// add radio buttons one for dropdown
                      Row(
                        children: [
                          Radio(
                            value: AnswerType.dropdown,
                            activeColor: Colors.lightBlue,
                            groupValue: state.answerType,
                            onChanged: (value) {
                              context.read<FormsBloc>().add(
                                    const SelectAnswerType(
                                      AnswerType.dropdown,
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(AnswerType.dropdown.value,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: state.answerType.value ==
                                          AnswerType.dropdown.value
                                      ? Colors.lightBlue
                                      : Colors.black)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (state.answerType == AnswerType.checkbox)

                    /// add a text field to get the question text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 34),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter your label here',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          context.read<FormsBloc>().add(
                                UpdateCheckBoxLabel(label: value),
                              );
                        },
                      ),
                    ),
                  if (state.answerType == AnswerType.checkbox)

                    /// add a button that will add a new box value
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.read<FormsBloc>().add(
                                AddCheckBox(
                                    checkBox: CheckBox(
                                  id: 1,
                                  label: '',
                                  boxValues: [
                                    BoxValue(
                                        id: 1, isSelected: true, value: "Yes")
                                  ],
                                )),
                              );
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(height: 40),
                              SizedBox(width: 16),
                              Text(
                                'Add Box Value',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.check_box,
                                color: Colors.white,
                              ),
                              SizedBox(width: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (state.answerType == AnswerType.checkbox)
                    if (state.form != null)
                      for (final eachBox in state.form!.checkBoxes)
                        for (final eachValue in eachBox.boxValues)
                          CheckboxListTile(
                            title: Text(eachValue.value),
                            value: eachValue.isSelected,
                            onChanged: (value) {},
                          ),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.pink,
            onPressed: () {

            },
            child: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
