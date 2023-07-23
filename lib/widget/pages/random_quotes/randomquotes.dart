import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../api/random_api.dart';
import '../../../api/share_api.dart';

class RandomQuotes extends StatefulWidget {
  const RandomQuotes({super.key});

  @override
  State<RandomQuotes> createState() => _RandomQuotesState();
}

class _RandomQuotesState extends State<RandomQuotes> {
  Map<String, dynamic>? quotes;
  bool isLoading = false;
  String quoteDetails = '';
  String animeDetails = '';
  String characterDetails = '';
  @override
  void initState() {
    getData();
    super.initState();
  }
   getData() async{
    quotes = await RandomAnimeQuotesApi().randomQuotesCall();
    if(quotes != null){
      setState(() {
        isLoading = true;
        quoteDetails = quotes!['quote'];
        animeDetails = quotes!['anime'];
        characterDetails = quotes!['character'];
      });
    }
   }
  @override
  Widget build(BuildContext context) {
    if (isLoading){
      return Padding(
        padding: const EdgeInsets.fromLTRB(23,16,14,16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text(
                        quoteDetails,
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
                            Flexible(
                              child: Text(
                                characterDetails,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.purple[800]
                                ),
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
                            Flexible(
                              child: Text(
                                animeDetails,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                    color: Colors.purple[800]
                                ),
                              ),
                            ),
                          ]
                      ),
                    ]
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Divider(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        ShareContents().shareContent(quoteDetails + '\n' + '- $characterDetails' + '\n' + '- $animeDetails');
                      },
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
                        getData();
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
                )
              ],
            )
          ],
        ),
      );
    }else{
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
