import 'package:dartz/dartz.dart';
import 'package:todo_app/src/core/error/failures.dart';
import 'package:todo_app/src/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  //add a todo
  Future<Either<Failure, void>> addTodo(String title, String description);

  //remove a todo
  Future<Either<Failure, void>> removeTodo(String id);

  //edit todo
  Future<Either<Failure, void>> editTodo(
    String id, {
    title,
    description,
    isCompleted,
  });

  //get all todos
  Future<Either<Failure, List<Todo>>> getAllTodos();
}
