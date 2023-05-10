import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/home_page.dart';
import 'package:firebase_project/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  // Get.put(HomeViewModel());
  // Get.put(DocumentListViewModel());
  // final LoginController controller = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;
  FormType _formType = FormType.login;

  bool validationAndSave() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save(); //save form de nhan duoc email va password
      return true;
    } else {
      return false;
    }
  }

  Future<void> validateAndSubmit() async {
    if (validationAndSave()) {
      try {
        if (_formType == FormType.login) {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _email.toString(), password: _password.toString());

          print('Signed in: ${user.user?.uid}');

          Get.toNamed(Routes.home);
        } else {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email.toString(), password: _password.toString());
          print('Register user: ${user.user}');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar('Error', 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  void moveToRegister() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          FocusScope.of(context).unfocus();
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(elevation: 0, iconTheme: IconThemeData(color: context.iconColor)),
          body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: text() + buildInputs() + buildSubmitButtons(),
                  ),
                )),
          ),
        ));
  }

  List<Widget> text() {
    return const [
      Text(
        'Login',
        style: TextStyle(
            fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
      )
    ];
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Value can\'t empty';
          }
          return null;
        },
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Value can\'t empty';
          }
          return null;
        },
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        ElevatedButton(
            onPressed: validateAndSubmit, child: const Text('Login')),
        ElevatedButton(
            onPressed: moveToRegister, child: const Text('Create Account')),
      ];
    } else {
      return [
        ElevatedButton(
            onPressed: validateAndSubmit, child: const Text('Create Account')),
        ElevatedButton(
            onPressed: moveToLogin,
            child: const Text('Have an Account? Login?')),
      ];
    }
  }
}
