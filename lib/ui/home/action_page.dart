import 'package:doctarantura/bloc/action_bloc/action_bloc.dart';
import 'package:doctarantura/bloc/action_bloc/action_event.dart';
import 'package:doctarantura/bloc/action_bloc/action_state.dart';
import 'package:doctarantura/default/default_text.dart';
import 'package:doctarantura/models/kengayuvchi_kirish_tili.dart';
import 'package:doctarantura/style/text_style.dart';
import 'package:doctarantura/ui/widgets/button.dart';
import 'package:doctarantura/ui/widgets/deceorations.dart';
import 'package:doctarantura/ui/widgets/my_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/dimens.dart';
import '../widgets/bottom_sheet_widget.dart';

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
      create: (ctx) => ActionBloc()..add(KirishTiliEvent()),
      child: BlocBuilder<ActionBloc, ActionState>(
        builder: (ctx, state) {
          bloc = BlocProvider.of<ActionBloc>(ctx);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Kengayuvchi kirish tili"),
              actions: [
                IconButton(
                  onPressed: () {
                    openBottom(ctx);
                  },
                  icon: Icon(
                    Icons.list_alt_outlined,
                    color: Colors.white,
                    size: Dimens.iconSize24,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(Dimens.height10),
                child:
                    BlocBuilder<ActionBloc, ActionState>(builder: (ctx, state) {
                  return state is OtAfiksatsiyaState
                      ? _otAfiksatsiya()
                      : state is OtKompozitsiyaState
                          ? _otKompozitsiya()
                          : state is KirishTiliState
                              ? _kirishTili(ctx)
                              : Container();
                }),
              ),
            ),
          );
        },
      ),
    );
  }

  itemKirishTili(KirishTili model) {
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

  void openBottom(BuildContext ctx) {
    Get.bottomSheet(
      Container(
        decoration: boottomShetDecoration(),
        padding: EdgeInsets.all(Dimens.height20),
        child: Column(
          children: [
            bottomSheetWidget(),
            Gap(Dimens.height10),
            _itemBottom(
              onTap: () {
                Get.back();
                bloc.add(SetDefaultEvent());
              },
              title: "Boshlang'ich xolatga keltirish",
            ),
            Gap(Dimens.height10),
            Row(
              children: [
                Expanded(
                  child: _itemBottom(
                    onTap: () {
                      Get.back();
                      bloc.add(OtAfiksatsiyaEvent());
                    },
                    title: "Ot affiksatsiya",
                  ),
                  flex: 1,
                ),
                Gap(Dimens.width15),
                Expanded(
                  child: _itemBottom(
                    onTap: () {
                      Get.back();
                      bloc.add(OtKompozitsiyaEvent());
                    },
                    title: "Ot kompozitsiya",
                  ),
                  flex: 1,
                ),
              ],
            ),
            Gap(Dimens.height10),
            _itemBottom(
              onTap: () {
                Get.back();
                bloc.add(KirishTiliEvent());
              },
              title: "Kirish tili",
            ),
          ],
        ),
      ),
    );
  }

  var codeController = TextEditingController();
  var nameUzController = TextEditingController();
  var nameRuController = TextEditingController();

  void openBottomAddKirishTili(BuildContext ctx) {
    Get.bottomSheet(
      Container(
        decoration: boottomShetDecoration(),
        padding: EdgeInsets.all(Dimens.height20),
        child: Column(
          children: [
            bottomSheetWidget(),
            Gap(Dimens.height10),
            Text(
              "Kengayuvchi kirish tiliga Alfabit qo'shing",
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            Gap(Dimens.height10),
            MyInputField(
              hint: "code",
              controller: codeController,
            ),
            Gap(Dimens.height10),
            MyInputField(
              hint: "nomi",
              controller: nameUzController,
            ),
            Gap(Dimens.height10),
            MyInputField(
              hint: "nomi(ruscha)",
              controller: nameRuController,
            ),
            Gap(Dimens.height10),
            Button(
              text: "qo'shish",
              onClick: () {
                Get.back();
                bloc.add(
                  AddKirishTiliEvent(
                    codeController.text.toString(),
                    nameUzController.text.toString(),
                    nameRuController.text.toString(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _itemBottom({
    required Function onTap,
    required String title,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        decoration: sosItemDecoration(),
        padding: EdgeInsets.symmetric(
          vertical: Dimens.height10,
          horizontal: Dimens.width10,
        ),
        child: Text(
          title,
          style: descriptionStyle,
        ),
      ),
    );
  }

  _otAfiksatsiya() {
    return Column(
      children: [
        Text(
          "Ot so'z turkumiga tegishli so'zlarning afiksatsiya bo'yicha matematik modellari",
          style: titleStyle,
          textAlign: TextAlign.justify,
        ),
        Gap(Dimens.height20),
        Text(
          otAfiksatsiya,
          style: descriptionStyle,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  _otKompozitsiya() {
    return Column(
      children: [
        Text(
          "Ot so'z turkumiga tegishli so'zlarning kompozitsiya bo'yicha matematik modellari",
          style: titleStyle,
          textAlign: TextAlign.justify,
        ),
        Gap(Dimens.height20),
        Text(
          otKompozitsiya,
          style: descriptionStyle,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  _kirishTili(BuildContext ctx) {
    return Column(
      children: [
        Text(
          "Kengayuvchi kirish tili",
          style: titleStyle,
        ),
        Gap(Dimens.height10),
        Button(
            text: "add kirish tili",
            onClick: () {
              openBottomAddKirishTili(ctx);
            }),
        Gap(Dimens.height10),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          itemCount: bloc.listKirishTili.length,
          itemBuilder: (context, index) {
            var model = bloc.listKirishTili[index];
            return itemKirishTili(model);
          },
        ),
      ],
    );
  }
}
