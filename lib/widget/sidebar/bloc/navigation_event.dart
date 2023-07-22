part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class InitialQuotesEvent extends NavigationEvent {}

class RandomQuotesClickedEvent extends NavigationEvent {}

class CharacterQuotesClickedEvent extends NavigationEvent {}

class AnimeNameQuotesClickedEvent extends NavigationEvent {}

class AnimeCharacterImageClickedEvent extends NavigationEvent {}
