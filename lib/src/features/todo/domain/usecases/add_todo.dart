// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/src/core/error/failures.dart';

import 'package:todo_app/src/core/usecases/usecase.dart';
import 'package:todo_app/src/features/todo/domain/repositories/todo_repository.dart';

class AddTodo extends Usecase<void, AddTodoParams> {
  final TodoRepository _repository;
  AddTodo(this._repository);

  @override
  Future<Either<Failure, void>> call(AddTodoParams params) async {
    return await _repository.addTodo(params.title, params.description);
  }
}

class AddTodoParams extends Equatable {
  final String title;
  final String description;
  const AddTodoParams({required this.title, required this.description});

  @override
  List<Object> get props => [title, description];
}
