class AISWEBException implements Exception {
  final String message;
  const AISWEBException([this.message]);

  String toString() {
    if (message == null) return "AISWEBException";
    return "AISWEBException: $message";
  }
}

//throwResponseCodeException() {
//  throw AISWEBException('Response code is not 200');
//}
