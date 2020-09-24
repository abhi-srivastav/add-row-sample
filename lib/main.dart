import 'package:add_row_sample/student_view.dart';
import 'package:add_row_sample/subject_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/student_bloc.dart';

void main() {
  runApp(BlocProvider<StudentBloc>(
    create: (context) => StudentBloc()..add(AddStudentInitiated()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Row Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Add Row Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    _onAddButtonPressed() {
      BlocProvider.of<StudentBloc>(context).add(AddSubjectInitiated());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Row Data'),
      ),
      body: BlocConsumer<StudentBloc, StudentState>(
        listenWhen: (previous, current) {
          if (current is SubjectAdded)
            return true;
          else
            return false;
        },
        listener: (context, state) {
          if (state is SubjectAdded) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.error),
                      Text(
                        'Subject Added',
                      ),
                    ],
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is StudentFormLoaded) {
            return StudentView(
              student: state.student,
            );
          } else if (state is SubjectAddFormLoaded) {
            return SubjectView();
          } else if (state is StudentSaved) {
            return Container(
              child: Center(
                child: Text('${state.student.toJson()}'),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Text('Loading......'),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAddButtonPressed,
      ),
    );
  }
}
