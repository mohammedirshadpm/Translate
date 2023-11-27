

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:untitled12/Respostry/ModelClass/translate.dart';

import '../Respostry/Api/translate_api.dart';



part 'translate_event.dart';
part 'translate_state.dart';

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  late Translate translate;
  TranslateApi translateApi=TranslateApi();
  TranslateBloc() : super(TranslateInitial()) {
    on<FetchTranslate>((event, emit) async{
      emit(TranslateLoading());
      try{

        translate = await translateApi.getAnime(event.text);
        emit(TranslateLoaded());
      } catch(e){
        print(e);
        emit(TranslatecError());
    }});
  }
}
