import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Login RXDart",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white54,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: MediaQuery.of(context).size.height / 12.4,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(10),
                child: Text(
                  "LOGIN UI",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://flutter.io/images/catalog-widget-placeholder.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              emailField(bloc),
              passwordField(bloc),
              submitButton(bloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'udacoding@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              obscureText: true,
              onChanged: bloc.changePassword,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snapshot.error,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return Container(
          child: OutlineButton(
            color: Colors.lightBlue,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black),
            ),
            onPressed: snapshot.hasData ? bloc.submit : null,
          ),
        );
      },
    );
  }
}
