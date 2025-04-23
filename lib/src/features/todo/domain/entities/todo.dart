import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
