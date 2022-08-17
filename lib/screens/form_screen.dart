import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamicapp/bloc/forms_bloc.dart';
import 'package:dynamicapp/screens/create_form_question.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormsBloc, FormsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Flex(
            direction: Axis.vertical,
            children: const <Widget>[
              SizedBox(height: 89),
              Center(
                child: Text(
                  'Create Form',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.pink,
            onPressed: () {
              /// navigate to CreateFormQuestion screen
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return BlocProvider<FormsBloc>.value(
                  value: context.read<FormsBloc>(),
                  child: const CreateFormQuestion(),
                );
              }));
            },
            child: const Icon(
              Icons.create,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
