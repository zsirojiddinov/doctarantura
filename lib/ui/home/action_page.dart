import 'package:doctarantura/bloc/action_bloc/action_bloc.dart';
import 'package:doctarantura/bloc/action_bloc/action_event.dart';
import 'package:doctarantura/bloc/action_bloc/action_state.dart';
import 'package:doctarantura/models/kengayuvchi_kirish_tili.dart';
import 'package:doctarantura/style/text_style.dart';
import 'package:doctarantura/ui/widgets/deceorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/dimens.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({Key? key}) : super(key: key);

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  late ActionBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => ActionBloc()..add(AllEvent()),
      child: BlocBuilder<ActionBloc, ActionState>(
        builder: (ctx, state) {
          bloc = BlocProvider.of<ActionBloc>(ctx);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Kengayuvchi kirish tili"),
            ),
            body: Container(
              padding: EdgeInsets.all(Dimens.height10),
              child: ListView.builder(
                shrinkWrap: true,
                primary: true,
                scrollDirection: Axis.vertical,
                itemCount: bloc.listKirishTili.length,
                itemBuilder: (context, index) {
                  var model = bloc.listKirishTili[index];
                  return item(model);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  item(KirishTili model) {
    return Container(
      decoration: editDecoration(),
      margin: EdgeInsets.symmetric(vertical: Dimens.height10 / 5),
      padding: EdgeInsets.all(Dimens.height10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              model.code,
              style: descriptionStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 10,
            child: Text(
              model.nameUz,
              style: descriptionStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 10,
            child: Text(
              model.nameRu,
              style: descriptionStyle,
            ),
          ),
        ],
      ),
    );
  }
}
