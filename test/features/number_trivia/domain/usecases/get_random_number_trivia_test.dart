import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_ca/core/usecases/usecases.dart';
import 'package:tdd_ca/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_ca/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:tdd_ca/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
import 'get_random_number_trivia_test.mocks.dart';

void main() {
  GetRandomNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test(
    'Should get trivia from the repository ',
    () async {
      // arrange
      when(mockNumberTriviaRepository!.getRandomNumberTrivia())
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      final result = await usecase!(NoParams());
      // assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository!.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository!);
    },
  );
}
