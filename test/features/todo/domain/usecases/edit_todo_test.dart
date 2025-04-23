import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app/src/features/todo/domain/usecases/edit_todo.dart';

class FakeTodoRepository extends Mock implements TodoRepository {}

void main() {
  late FakeTodoRepository fakeTodoRepository;
  late EditTodo editTodoUseCase;

  setUp(() {
    fakeTodoRepository = FakeTodoRepository();
    editTodoUseCase = EditTodo(fakeTodoRepository);
  });

  final tId = '123';
  final tTitle = 'Hello';
  final tDescription = 'World';
  final tIsCompleted = true;
  final tParams = EditTodoParams(
    tId,
    title: tTitle,
    description: tDescription,
    isCompleted: tIsCompleted,
  );

  test(
    'Given EditTodo class should return a valid null after editing all fields',
    () async {
      //arrange
      when(
        () => fakeTodoRepository.editTodo(
          tId,
          title: tTitle,
          description: tDescription,
          isCompleted: tIsCompleted,
        ),
      ).thenAnswer((_) async => Future.value(Right(null)));
      //act
      final result = await editTodoUseCase(tParams);
      //assert
      verify(
        () => fakeTodoRepository.editTodo(
          tId,
          title: tTitle,
          description: tDescription,
          isCompleted: tIsCompleted,
        ),
      );
      expect(result, equals(Right(null)));
    },
  );

  test(
    'Given EditTodo class should return a valid null after editing the title',
    () async {
      // arrange
      final tParam = EditTodoParams(tId, title: tTitle);
      when(
        () => fakeTodoRepository.editTodo(tId, title: tTitle),
      ).thenAnswer((_) async => Future.value(Right(null)));
      //act
      final result = await editTodoUseCase(tParam);
      //assert
      verify(() => fakeTodoRepository.editTodo(tId, title: tTitle));
      expect(result, equals(Right(null)));
    },
  );

  test(
    'Given EditTodo class should return a valid null after editing the isCompleted',
    () async {
      //arrange
      final tParam = EditTodoParams(tId, isCompleted: tIsCompleted);
      when(
        () => fakeTodoRepository.editTodo(tId, isCompleted: tIsCompleted),
      ).thenAnswer((_) async => Future.value(Right(null)));
      //act
      final result = await editTodoUseCase(tParam);
      //assert
      verify(() => fakeTodoRepository.editTodo(tId, isCompleted: tIsCompleted));
      expect(result, equals(Right(null)));
    },
  );

  test(
    'Given EditTodo class should return a valid null after editing the description',
    () async {
      //arrange
      final tParam = EditTodoParams(tId, description: tDescription);
      when(
        () => fakeTodoRepository.editTodo(tId, description: tDescription),
      ).thenAnswer((_) async => Future.value(Right(null)));
      //act
      final result = await editTodoUseCase(tParam);
      //assert
      verify(() => fakeTodoRepository.editTodo(tId, description: tDescription));
      expect(result, equals(Right(null)));
    },
  );
}
