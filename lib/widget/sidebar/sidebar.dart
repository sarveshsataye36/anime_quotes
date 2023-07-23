import 'dart:async';
import 'package:anime_quotes/widget/sidebar/bloc/navigation_bloc.dart';
import 'package:anime_quotes/widget/sidebar/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  late StreamController<bool>
      isSidebarOpenedStreamController; // adding late modifier
  late AnimationController _animationController; // adding late modifier
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 400);
  var openOrClose;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, AsyncSnapshot<bool> isSideBarOpenedAsync) {
        if (isSideBarOpenedAsync.hasData) {
          if (isSideBarOpenedAsync.data == null) {
            openOrClose = false;
          } else {
            openOrClose = isSideBarOpenedAsync.data;
          }
        } else {
          openOrClose = false;
        }

        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: openOrClose ? 0 : -screenWidth,
          right: openOrClose
              ? 0
              : screenWidth - 45, // 45 gives right width when close
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.deepPurple[900],
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      ListTile(
                        title: Text(
                          "Anime Quotes",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40.0,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        title: 'Random Quotes',
                        icon: Icons.circle_outlined,
                        onTapFunction: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(RandomQuotesClickedEvent());
                        },
                      ),
                      MenuItem(
                        title: 'Anime Quotes',
                        icon: Icons.circle_outlined,
                        onTapFunction: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(
                              AnimeNameQuotesClickedEvent());
                        },
                      ),
                      MenuItem(
                        title: 'Character Quotes',
                        icon: Icons.circle_outlined,
                        onTapFunction: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(
                              CharacterQuotesClickedEvent());
                        },
                      ),
                      MenuItem(
                        title: 'Character Images',
                        icon: Icons.circle_outlined,
                        onTapFunction: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(
                              AnimeCharacterImageClickedEvent());
                        },
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        title: 'Share',
                        icon: Icons.share,
                        onTapFunction: () {
                          onIconPressed();
                        },
                      ),
                      MenuItem(
                        title: 'Rate',
                        icon: Icons.star_rate,
                        onTapFunction: () {
                          onIconPressed();
                        },
                      ),
                      MenuItem(
                        title: 'Exit',
                        icon: Icons.logout,
                        onTapFunction: () {
                          SystemNavigator.pop();
                          onIconPressed();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.deepPurple[900],
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController.view,
                        color: Colors.white60,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;
    //
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
