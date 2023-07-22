import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../api/anime_pic.dart';
import 'package:image_downloader/image_downloader.dart';
import 'dart:math';
class CharacterImage extends StatefulWidget {
  const CharacterImage({super.key});

  @override
  State<CharacterImage> createState() => _CharacterImageState();
}

class _CharacterImageState extends State<CharacterImage> {
  Map<String, dynamic>? animepic;
  bool isLoading = false;
  String urli = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async{
    animepic = await RandomAnimePicApi().randomAnimePicCall();
    if(animepic != null){
      setState(() {
        isLoading = true;
        urli = animepic?['url'];
      });
    }
  }

  downloadImage(imgUrl) async{
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(imgUrl,destination: AndroidDestinationType.directoryDownloads..subDirectory("Anime"+ randomNumber.toString() +".png"));
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
  @override
  Widget build(BuildContext context) {

    if(isLoading){
      return Padding(padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Image.network(
              "$urli",
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
            ),
          ),

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
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: (){
                      downloadImage(urli);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 31.0,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.arrow_downward,
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
            ]
          )
        ],
      )
      );
    }else{
      return Padding(padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Center(
          child: LoadingAnimationWidget.flickr(
            size: 60,
            leftDotColor: Colors.purple,
            rightDotColor: Colors.blue,
          ),
      ),
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
                        SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                          onTap: (){
                            downloadImage(urli);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 31.0,
                            child: CircleAvatar(
                              child: Icon(
                                Icons.arrow_downward,
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
                  ]
              )
            ],
          )
      );
    }

  }
}
