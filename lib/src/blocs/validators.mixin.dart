import 'dart:async';

class ValidatorMixin {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, EventSink sink) {
      if (email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError("Enter a valid email!");
      }
    },
  );

  final validatePass = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, sink) {
      if (password.length > 4) {
        sink.add(password);
      } else {
        sink.addError("Enter a longer password!");
      }
    },
  );
}
