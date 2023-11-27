part of 'translate_bloc.dart';

@immutable
abstract class TranslateEvent {}

class FetchTranslate extends TranslateEvent{
final String text;
FetchTranslate({required this.text});
}
