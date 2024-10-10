import 'package:contapp/design/errors.dart';

String? validateInput(value) {
  if (value == null || value.isEmpty) {
    return SysifosErrors.userError;
  }
  if (value!.length >= 10) {
    return SysifosErrors.userErrorLen;
  }
  return null;
}
