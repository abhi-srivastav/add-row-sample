part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentFormLoaded extends StudentState {
  final Student student;

  StudentFormLoaded({this.student});

  @override
  List<Object> get props => [student];
}

class SubjectAddFormLoaded extends StudentState {}

class SubjectAdded extends StudentState {
  final List<Subject> subjects;

  SubjectAdded({this.subjects});
  @override
  List<Object> get props => [subjects];
}

class StudentSaved extends StudentState {
  final Student student;

  StudentSaved({this.student});
  @override
  List<Object> get props => [student];
}
