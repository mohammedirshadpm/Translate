part of 'translate_bloc.dart';

@immutable
abstract class TranslateState {}

class TranslateInitial extends TranslateState {}
class TranslateLoading extends TranslateState {}
class TranslateLoaded extends TranslateState {}
class TranslatecError extends TranslateState{}