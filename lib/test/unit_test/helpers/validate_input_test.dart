import 'package:contapp/design/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contapp/pages/helper/validate_input.dart';

void main() {
  group('Testing Validate Input', () {
    test('invalid user', () {
      //Arrenge -> nos preparamos para ejecutar el test
      const inputValue = 'OsmanAhumada';
      const expectedError = SysifosErrors.userErrorLen;

      //Act -> Ejecutamos la acción probar
      final currentValue = validateInput(inputValue);

      //Assert --> Evaluar si el resultado es el esperado
      expect(currentValue, expectedError);
    });
    test('invalid user null', () {
      //Arrenge -> nos preparamos para ejecutar el test
      String? inputValue;
      const expectedError = SysifosErrors.userError;

      //Act -> Ejecutamos la acción probar
      final currentValue = validateInput(inputValue);

      //Assert --> Evaluar si el resultado es el esperado
      expect(currentValue, expectedError);
    });
    test('valid user', () {
      //Arrenge -> nos preparamos para ejecutar el test
      const inputValue = 'Osman';
      String? expectedError;

      //Act -> Ejecutamos la acción probar
      final currentValue = validateInput(inputValue);

      //Assert --> Evaluar si el resultado es el esperado
      expect(currentValue, expectedError);
    });
  });
}
