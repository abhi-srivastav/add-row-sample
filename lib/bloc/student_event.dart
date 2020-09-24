part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object> get props => [];
}

class AddStudentInitiated extends StudentEvent {}

class AddSubjectInitiated extends StudentEvent {}

class AddSubjectConfirm extends StudentEvent {
  final Subject subject;

  AddSubjectConfirm({this.subject});

  @override
  List<Object> get props => [subject];
}

class AddStudentConfirm extends StudentEvent {
  final Student student;

  AddStudentConfirm({this.student});

  @override
  List<Object> get props => [student];
}
