part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class RandomQuotesClickedState extends NavigationState {}

class CharacterQuotesClickedState extends NavigationState {}

class AnimeNameQuotesClickedState extends NavigationState {}
