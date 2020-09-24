import 'package:add_row_sample/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/student_bloc.dart';

class SubjectView extends StatefulWidget {
  SubjectView({Key key}) : super(key: key);

  @override
  _SubjectViewState createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  @override
  Widget build(BuildContext context) {
    _onSubmitButtonPressed() {
      BlocProvider.of<StudentBloc>(context)
          .add(AddSubjectConfirm(subject: Subject(name: _name)));
    }

    final nameInput = TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0.0,
        ),
      ),
      keyboardType: TextInputType.text,
      onChanged: (value) => _name = value.trim(),
      validator: (value) => value.isEmpty ? 'Please provide name' : null,
    );

    return Container(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              nameInput,
              RaisedButton(
                child: Text('Save'),
                onPressed: _onSubmitButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
