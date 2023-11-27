import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled12/Respostry/ModelClass/translate.dart';

import '../Bloc/translate_bloc.dart';
import '../Respostry/ModelClass/translate.dart';
import '../Respostry/ModelClass/translate.dart';
import '../Respostry/ModelClass/translate.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

late Translate translatModal;
TextEditingController text=TextEditingController();
class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey,
                ),
                width: 280,
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.only(left: 80, top: 50),
                  child: TextFormField(controller: text,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<TranslateBloc>(context).add(FetchTranslate(text:text.text ));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                width: 100,
                height: 85,
                child: Center(
                    child: Text(
                  "Get",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<TranslateBloc, TranslateState>(
                builder: (context, state) {
              if (state is TranslateLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is TranslatecError) {
                return Center(
                  child: Text("ERROR",style: TextStyle(color: Colors.white),),
                );
              }
              if (state is TranslateLoaded) {
                translatModal =
                    BlocProvider.of<TranslateBloc>(context).translate;
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey,
                  ),
                  width: 280,
                  height: 160,
                  child: Center(child: Text(translatModal.trans.toString())),
                );
              } else {
                return SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }
}
