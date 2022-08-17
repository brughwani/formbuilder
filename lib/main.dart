import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamicapp/bloc/forms_bloc.dart';
import 'package:dynamicapp/screens/form_screen.dart';

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => FormsBloc(),
        child: const FormScreen(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}

void main() {
  /// ensure initialization
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const FormApp());
}
