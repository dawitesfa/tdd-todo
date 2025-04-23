import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/src/core/error/failures.dart';
import 'package:todo_app/src/core/usecases/usecase.dart';
import 'package:todo_app/src/features/todo/domain/repositories/todo_repository.dart';

class RemoveTodo implements Usecase<void, RemoveTodoParams> {
  final TodoRepository _repository;
  const RemoveTodo(this._repository);

  @override
  Future<Either<Failure, void>> call(RemoveTodoParams params) async {
    return await _repository.removeTodo(params.id);
  }
}

class RemoveTodoParams extends Equatable {
  final String id;

  const RemoveTodoParams({required this.id});

  @override
  List<Object?> get props => [id];
}
