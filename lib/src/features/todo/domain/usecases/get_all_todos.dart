import 'package:dartz/dartz.dart';
import 'package:todo_app/src/core/error/failures.dart';
import 'package:todo_app/src/core/usecases/usecase.dart';
import 'package:todo_app/src/features/todo/domain/entities/todo.dart';
import 'package:todo_app/src/features/todo/domain/repositories/todo_repository.dart';

class GetAllTodos extends Usecase<List<Todo>, NoParams> {
  final TodoRepository _repository;
  GetAllTodos(this._repository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await _repository.getAllTodos();
  }
}
