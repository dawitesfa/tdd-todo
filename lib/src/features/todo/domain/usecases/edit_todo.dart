// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_app/src/core/error/failures.dart';
import 'package:todo_app/src/core/usecases/usecase.dart';
import 'package:todo_app/src/features/todo/domain/repositories/todo_repository.dart';

class EditTodo extends Usecase<void, EditTodoParams> {
  final TodoRepository _repository;
  EditTodo(this._repository);
  @override
  Future<Either<Failure, void>> call(EditTodoParams params) async {
    return await _repository.editTodo(
      params.id,
      title: params.title,
      description: params.description,
      isCompleted: params.isCompleted,
    );
  }
}

class EditTodoParams extends Equatable {
  final String id;
  final String? title;
  final String? description;
  final bool? isCompleted;

  const EditTodoParams(
    this.id, {
    this.title,
    this.description,
    this.isCompleted,
  });

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
