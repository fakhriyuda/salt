import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_test/features/home/presentation/home_page.dart';
import 'package:salt_test/features/login/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  LoginBloc loginBloc = LoginBloc();

  @override
  void initState() {
    // TODO: implement initState
    userCtrl.text = 'eve.holt@reqres.in';
    passCtrl.text = 'cityslicka';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer(
      bloc: loginBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logo_dev_outlined,
                  size: MediaQuery.of(context).size.width / 2),
              TextField(
                decoration: const InputDecoration(label: Text('Email')),
                onChanged: (value) {
                  userCtrl.text = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(label: Text('Password')),
                obscureText: true,
                onChanged: (value) {
                  passCtrl.text = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 36),
                    ),
                    onPressed: () {
                      debugPrint("email : ${userCtrl.text}");
                      debugPrint("pass : ${passCtrl.text}");
                      loginBloc.add(
                          LoginGo(email: userCtrl.text, password: passCtrl.text));
                    },
                    child: state is LoginLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login')),
              )
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
    ));
  }
}
