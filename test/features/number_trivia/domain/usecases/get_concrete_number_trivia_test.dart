import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_ca/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_ca/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:tdd_ca/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
import 'get_concrete_number_trivia_test.mocks.dart';

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);
  test(
    'Should get trivia for the number from the repository ',
    () async {
      // arrange
      when(mockNumberTriviaRepository!.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      final result = await usecase!(const Params(number: tNumber));
      // assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository!.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository!);
    },
  );
}
