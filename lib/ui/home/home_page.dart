import 'package:doctarantura/bloc/home_bloc/main_bloc.dart';
import 'package:doctarantura/bloc/home_bloc/main_event.dart';
import 'package:doctarantura/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../bloc/home_bloc/main_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MainBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (ctx, state) {
          bloc = BlocProvider.of<MainBloc>(ctx);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: GestureDetector(
                onTap: () {
                  bloc.add(StartEvent());
                },
                child: Text(
                  "davay",
                  style: textStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
