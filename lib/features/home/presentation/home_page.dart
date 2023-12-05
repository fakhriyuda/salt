import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_test/features/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(GetHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Salt Member"),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white),
      body: BlocConsumer(
          bloc: homeBloc,
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeSuccess) {
              return ListView.builder(
                  itemCount: homeBloc.users.length,
                  itemBuilder: (context, index) {
                    var data = homeBloc.users[index];
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(data.avatar ?? '')),
                      title: Text(
                          "${data.firstName ?? ""} ${data.lastName ?? ""}"),
                      subtitle: Text(data.email ?? "",
                          style: const TextStyle(color: Colors.grey)),
                    );
                  });
            }
            if (state is HomeFailed) {
              return Text(state.error.toString());
            }
            return const SizedBox();
          },
          listener: (context, state) {
            if (state is HomeFailed) {
              // error message pop up
              debugPrint(state.error.toString());
            }
          }),
    );
  }
}
