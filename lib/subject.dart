import 'dart:convert';

import 'package:equatable/equatable.dart';

class Subject extends Equatable {
  final String name;
  Subject({
    this.name,
  });

  @override
  List<Object> get props => [name];

  Subject copyWith({
    String name,
  }) {
    return Subject(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Subject(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
