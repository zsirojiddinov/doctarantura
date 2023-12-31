import 'package:doctarantura/bloc/home_bloc/main_bloc.dart';
import 'package:doctarantura/bloc/home_bloc/main_event.dart';
import 'package:doctarantura/style/text_style.dart';
import 'package:doctarantura/ui/widgets/button.dart';
import 'package:doctarantura/ui/widgets/my_input.dart';
import 'package:doctarantura/utils/dimens.dart';
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
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (ctx, state) {
          bloc = BlocProvider.of<MainBloc>(ctx);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "doctarantura",
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    bloc.add(AllEvent());
                  },
                  icon: Icon(
                    Icons.border_all_outlined,
                    size: Dimens.iconSize24,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    MyInputField(
                      controller: textController,
                    ),
                    Button(
                        text: "qidirish",
                        onClick: () {
                          bloc.add(
                            StartEvent(textController.text.toString()),
                          );
                        }),
                    Button(
                        text: "bajar",
                        onClick: () {
                          bloc.add(
                            MatModelEvent(),
                          );
                        }),
                    Text(
                      bloc.myText,
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
