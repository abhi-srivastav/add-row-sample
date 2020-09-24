import 'package:add_row_sample/bloc/student_bloc.dart';
import 'package:add_row_sample/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentView extends StatefulWidget {
  StudentView({Key key, this.student}) : super(key: key);
  final Student student;

  @override
  _StudentViewState createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _grade;

  @override
  Widget build(BuildContext context) {
    _onSubmitButtonPressed() {
      BlocProvider.of<StudentBloc>(context).add(AddStudentConfirm(
          student: widget.student.copyWith(name: _name, grade: _grade)));
    }

    final nameInput = TextFormField(
      initialValue: widget.student.name,
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

    final gradeInput = TextFormField(
      initialValue: widget.student.grade,
      decoration: InputDecoration(
        labelText: 'Grade',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0.0,
        ),
      ),
      keyboardType: TextInputType.text,
      onChanged: (value) => _grade = value.trim(),
      validator: (value) => value.isEmpty ? 'Please provide grade' : null,
    );

    final subjects = widget.student.subjects?.toString();

    return Container(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              nameInput,
              gradeInput,
              Text('Subjects: $subjects'),
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
