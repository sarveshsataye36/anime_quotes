part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class RandomQuotesClickedEvent extends NavigationEvent {}

class CharacterQuotesClickedEvent extends NavigationEvent {}

class AnimeNameQuotesClickedEvent extends NavigationEvent {}
