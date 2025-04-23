import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app/src/features/todo/domain/usecases/add_todo.dart';

class FakeTodoRepository extends Mock implements TodoRepository {}

void main() {
  late FakeTodoRepository fakeTodoRepository;
  late AddTodo addTodoUseCase;
  setUp(() {
    fakeTodoRepository = FakeTodoRepository();
    addTodoUseCase = AddTodo(fakeTodoRepository);
  });
  final tTitle = 'Hello';
  final tDescription = 'World';

  test('should return a null/void value', () async {
    //arrange
    when(
      () => fakeTodoRepository.addTodo(tTitle, tDescription),
    ).thenAnswer((_) => Future.value(Right(null)));
    //act
    await addTodoUseCase(
      AddTodoParams(title: tTitle, description: tDescription),
    );
    //assert
    verify(() => fakeTodoRepository.addTodo(tTitle, tDescription));
  });
}
