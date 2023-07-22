import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../api/character_anime_quotes_api.dart';

class CharacterQuotes extends StatefulWidget {
  const CharacterQuotes({super.key});

  @override
  State<CharacterQuotes> createState() => _CharacterQuotesState();
}

class _CharacterQuotesState extends State<CharacterQuotes> {
  Map<String, dynamic>? quotes;
  Map<String, dynamic>? animepic;
  bool isLoading = false;
  var searchText = 'luffy';
  // defining text controller
  final searchController = TextEditingController();
  //

  @override
  void initState() {
    getData(searchText);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }
  getData(String animeName) async{
    quotes = await SpecificAnimeQuotesApi().specificQuotesCall('character', animeName);
    if(quotes != null){
      setState(() {
        isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var error;
    if(quotes?['error'] == null){
      error = '';
    }else{
      error = 'error';
    }
    if (isLoading == true && error ==''){
      return Padding(
        padding: const EdgeInsets.fromLTRB(23,16,14,16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(padding: EdgeInsets.fromLTRB(32, 0, 5, 0),
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      hintText: 'Search character name..',
                      suffixIcon: IconButton(onPressed: (){
                        if(searchController.text  != ''){
                          setState(() {
                            searchText = searchController.text;
                          });
                          getData(searchController.text);
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Empty text...try to search anime name"),
                          ));
                        }
                      }, icon: Icon(Icons.search)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text(
                        quotes?['quote'],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            color: Colors.black87
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                          children: <Widget>[
                            Icon(
                              Icons.label_important_outlined,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              quotes?['character'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.purple[800]
                              ),
                            ),
                          ]
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          children: <Widget>[
                            Icon(
                              Icons.label_important_outlined,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              quotes?['anime'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.purple[800]
                              ),
                            ),
                          ]
                      ),
                    ]
                ),
              ],
            ),
            // SizedBox(
            //   height: 80,
            // ),
            Column(
              children: <Widget>[
                Divider(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 31.0,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.share_outlined,
                            color: Colors.blueAccent,
                          ),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: (){
                        getData(searchText);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 31.0,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.blueAccent,
                          ),
                          radius: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      );
    }else if(error !=''){
      return Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(padding: EdgeInsets.fromLTRB(32, 0, 5, 0),
            child: TextField(
              controller: searchController,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                hintText: 'Search character name..',
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    searchText = searchController.text;
                  });
                  getData(searchController.text);
                }, icon: Icon(Icons.search)),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              quotes?['error'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: 'Roboto',
              ),
            ),
          )
        ],
      );
    } else{
      return Center(
        child: LoadingAnimationWidget.flickr(
          size: 60,
          leftDotColor: Colors.purple,
          rightDotColor: Colors.blue,
        ),
      );
    }
  }
}
