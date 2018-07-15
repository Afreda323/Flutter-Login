import 'dart:async';
import 'validators.mixin.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with ValidatorMixin {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Get stream values
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePass);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  // Update stream values
  Function(String) get updateEmail => _email.sink.add;
  Function(String) get updatePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print("Email: $validEmail, Password: $validPassword");
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
