import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_app/src/features/todo/domain/usecases/remove_todo.dart';

class FakeTodoRepository extends Mock implements TodoRepository {}

void main() {
  late FakeTodoRepository fakeTodoRepository;
  late RemoveTodo removeTodoUseCase;

  setUp(() {
    fakeTodoRepository = FakeTodoRepository();
    removeTodoUseCase = RemoveTodo(fakeTodoRepository);
  });

  final tId = '123';

  test("Should remove a todo from datasource", () async {
    //arrange
    when(
      () => fakeTodoRepository.removeTodo(tId),
    ).thenAnswer((_) async => Future.value(Right(null)));
    //act
    final result = await removeTodoUseCase(RemoveTodoParams(id: tId));
    //assert
    verify(() => fakeTodoRepository.removeTodo(tId));
    expect(result, equals(Right(null)));
  });
}
