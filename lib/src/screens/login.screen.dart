import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: Container(
          margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 15.0,
            bottom: 30.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildHeader(),
              buildEmail(bloc),
              buildPassword(bloc),
              buildSubmit(bloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      child: Text(
        "Log In",
        style: TextStyle(fontSize: 25.0),
      ),
    );
  }

  Widget buildEmail(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(bottom: 25.0),
          child: TextField(
            onChanged: bloc.updateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorText: snapshot.error,
              suffixIcon: Icon(Icons.mail_outline),
              hintText: "email@address.com",
              labelText: "Email Address",
            ),
          ),
        );
      },
    );
  }

  Widget buildPassword(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(bottom: 25.0),
          child: TextField(
            onChanged: bloc.updatePassword,
            obscureText: true,
            decoration: InputDecoration(
              errorText: snapshot.error,
              suffixIcon: Icon(Icons.lock_outline),
              hintText: "password123",
              labelText: 'Password',
            ),
          ),
        );
      },
    );
  }

  Widget buildSubmit(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          textColor: Colors.white,
          color: Colors.teal,
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text("Submit"),
          ),
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
