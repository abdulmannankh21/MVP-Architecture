import 'package:flutter/material.dart';

import '../contracts/contractLogin.dart';
import '../presenter/presenterLogin.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements View {
  TextEditingController cntrlEmail = TextEditingController();
  TextEditingController cntrlPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var msg;
  late Presenter presenter;

  @override
  void initState() {
    super.initState();
    //subscribe to presenter here
    PresenterLogin(this); //passing this view to login presenter;
    presenter.subscribe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              Text(msg == null ? '' : '$msg'),
              TextFormField(
                controller: cntrlEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
                validator: (value) {
                  //here, you write you input specific validation and return an error string to display or nothing to continue
                },
                onSaved: (value) {
                  //called when there's no error
                  presenter.setEmail(value!);
                },
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              TextFormField(
                controller: cntrlPassword,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
                validator: (value) {
                  //here, you write you input specific validation and return an error string to display or nothing to continue
                },
                onSaved: (value) {
                  //called when there's no error
                  presenter.setPassword(value!);
                },
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //meaning no error found in form

                    formKey.currentState?.save();
                    presenter.doLogin();
                  }
                },
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  gotoHomePage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return HomePage();
    }));
  }

  @override
  refresh() {
    setState(() {}); //this will refresh the view hierarchy state when called
  }

  @override
  setPresenter(t) {
    presenter = t;
  }

  @override
  showError(msg) {
    this.msg=msg;
    refresh();
  }

  @override
  showSuccess(msg) {
    this.msg=msg;
    refresh();
  }
}