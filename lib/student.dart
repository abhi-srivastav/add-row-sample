import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:add_row_sample/subject.dart';

class Student extends Equatable {
  String name;
  String grade;
  List<Subject> subjects;
  Student({
    this.name,
    this.grade,
    this.subjects,
  });

  Student copyWith({
    String name,
    String grade,
    List<Subject> subjects,
  }) {
    return Student(
      name: name ?? this.name,
      grade: grade ?? this.grade,
      subjects: subjects ?? this.subjects,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'grade': grade,
      'subjects': subjects?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Student(
      name: map['name'],
      grade: map['grade'],
      subjects:
          List<Subject>.from(map['subjects']?.map((x) => Subject.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));

  @override
  String toString() =>
      'Student(name: $name, grade: $grade, subjects: $subjects)';

  @override
  List<Object> get props => [name, grade, subjects];
}
