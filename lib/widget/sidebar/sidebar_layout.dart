import '../sidebar/bloc/navigation_bloc.dart';
import 'package:anime_quotes/widget/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/anime_quotes/animequotes.dart';
import '../pages/random_quotes/randomquotes.dart';
import '../pages/character_quotes/characterquotes.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
                  if (state is NavigationInitial) {
                    return RandomQuotes();
                  }else if(state is RandomQuotesClickedState){
                    return RandomQuotes();
                  }else if(state is CharacterQuotesClickedState){
                    return CharacterQuotes();
                  }else if(state is AnimeNameQuotesClickedState){
                    return AnimeQuotes();
                  }else{
                    return RandomQuotes();
                  }
               }),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
