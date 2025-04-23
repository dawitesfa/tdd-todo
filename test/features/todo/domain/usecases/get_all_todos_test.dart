import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/core/usecases/usecase.dart';
import 'package:todo_app/src/features/todo/domain/entities/todo.dart';
import 'package:todo_app/src/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app/src/features/todo/domain/usecases/get_all_todos.dart';

class FakeTodoRepository extends Mock implements TodoRepository {}

void main() {
  late FakeTodoRepository fakeTodoRepository;
  late GetAllTodos getAllTodosUseCase;
  setUp(() {
    fakeTodoRepository = FakeTodoRepository();
    getAllTodosUseCase = GetAllTodos(fakeTodoRepository);
  });
  final todo1 = Todo(
    id: '1',
    title: 'Todo 1',
    description: 'Description 1',
    isCompleted: false,
  );
  final todo2 = Todo(
    id: '2',
    title: 'Todo 2',
    description: 'Description 2',
    isCompleted: true,
  );
  final allTodos = [todo1, todo2];
  test("Given GetAllTodos should return a list of Todo", () async {
    //arrange
    when(
      () => fakeTodoRepository.getAllTodos(),
    ).thenAnswer((_) async => Future.value(Right(allTodos)));
    //act
    final result = await getAllTodosUseCase(NoParams());
    //assert
    verify(() => fakeTodoRepository.getAllTodos());
    expect(result, equals(Right(allTodos)));
  });
}
