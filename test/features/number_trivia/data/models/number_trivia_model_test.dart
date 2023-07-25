import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_ca/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:tdd_ca/features/number_trivia/domain/entities/number_trivia.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test('should be a NumberTrivia entity', () {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });
}
