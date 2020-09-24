import 'dart:async';

import 'package:add_row_sample/student.dart';
import 'package:add_row_sample/subject.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  Student student;
  StudentBloc() : super(StudentInitial());

  @override
  Stream<StudentState> mapEventToState(
    StudentEvent event,
  ) async* {
    if (event is AddStudentInitiated) {
      student = new Student(
        subjects: [
          Subject(name: 'Maths'),
        ],
      );
      yield StudentFormLoaded(student: student);
    }

    if (event is AddSubjectInitiated) yield SubjectAddFormLoaded();
    if (event is AddSubjectConfirm) {
      final subject = event.subject;
      print('Student: $student');
      print('Student: ${student.subjects}');
      final subjects = List<Subject>.from(student.subjects)..add(subject);
      student = student.copyWith(subjects: subjects);
      yield SubjectAdded(subjects: subjects);
      yield StudentFormLoaded(student: student);
    }
    if (event is AddStudentConfirm) {
      student = event.student;
      yield StudentSaved(student: student);
    }
  }
}
