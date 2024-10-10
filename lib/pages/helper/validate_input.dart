String? validateInput(value) {
  if (value == null || value.isEmpty) {
    // return WeinFluErrors.userError;
  }
  if (value!.length >= 10) {
    // return WeinFluErrors.userErrorLen;
    return 'supera el maximo';
  }
  return null;
}
