import 'dart:convert';
import 'package:image_downloader/image_downloader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var urlData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData("${Query.text}","${Page.text}");
  }

  getApiData(String query,String page) async {
    var url = Uri.parse(
        'https://api.unsplash.com/search/photos?page=${page}&per_page=30&query=${query}?&client_id=vn8VdttRASysjGWXKMcy-ALde7_vXFSHDOrQ2fnAZ3I');
    http.Response response = await http.get(url);

    urlData = jsonDecode(response.body);
  }

  TextEditingController Query = TextEditingController();
  TextEditingController Page = TextEditingController();



  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0e0023), Color(0xff3a1e54)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 45, right: 20, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MuAwesom',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                          textAlign: TextAlign.left),
                      Text('Best Wallpapers Just For You',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 6, bottom: 6),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextField(
                        onSubmitted: (value){
                          setState(() {
                            getApiData(Query.text,'1');
                          });
                        },
                        key: UniqueKey(),
                        controller: Query,
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search),
                              color: Color(0xff1b1b1b),
                              onPressed: () {
                                setState(() {
                                  getApiData(Query.text,'1');
                                });
                              },
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: Color(0xff1b1b1b),
                              ),
                              onPressed: () {
                                setState(() {
                                  getApiData("art",'1');
                                  Query.clear();
                                });
                              },
                            ),
                            hintText: 'Search...',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
                  child: Container(
                    height: 80,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Query.text = 'Art';
                                  });
                                },
                                child: Container(
                                  height: 80,
                                   width : 120,
                                   decoration: BoxDecoration(
                                     borderRadius:
                                     BorderRadius.circular(6.0),
                                  image: DecorationImage(
                                    image: NetworkImage("https://artecombicicleta.files.wordpress.com/2013/01/boy-bicycle-city-drawing-paint-art-wallpaper-1920x1200.jpg",),
                                    fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate,)
                                  ),),
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Art',style: TextStyle(fontSize: 32,color: Colors.white.withOpacity(0.8)),),
                                  )),
                                ),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Query.text ='Sports';
                                  });
                                },
                                child: Container(
                                  height: 80,
                                  width : 120,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(6.0),
                                    image: DecorationImage(
                                        image: NetworkImage("https://images.wallpaperscraft.com/image/single/soccer_ball_football_lawn_121273_1920x1080.jpg",),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate,)
                                    ),),
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Sports',style: TextStyle(fontSize: 32,color: Colors.white.withOpacity(0.8)),),
                                  )),
                                ),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Query.text = 'Fantasy';
                                  });
                                },
                                child: Container(
                                  height: 80,
                                  width : 120,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(6.0),
                                    image: DecorationImage(
                                        image: NetworkImage("https://wallpaper-house.com/data/out/9/wallpaper2you_332113.jpg",),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate,)
                                    ),),
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Fantasy',style: TextStyle(fontSize: 28,color: Colors.white.withOpacity(0.8)),),
                                  )),
                                ),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Query.text = 'Science';
                                  });
                                },
                                child: Container(
                                  height: 80,
                                  width : 120,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(6.0),
                                    image: DecorationImage(
                                        image: NetworkImage("https://i.pinimg.com/originals/4f/15/20/4f1520d4c04ddc4632821ba6621c806e.jpg",),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate,)
                                    ),),
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Science',style: TextStyle(fontSize: 28,color: Colors.white.withOpacity(0.8)),),
                                  )),
                                ),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Query.text = 'Music';
                                  });
                                },
                                child: Container(
                                  height: 80,
                                  width : 120,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(6.0),
                                    image: DecorationImage(
                                        image: NetworkImage("https://i.pinimg.com/originals/ea/e8/5b/eae85b1dea5404b8299212d66a13fed5.jpg",),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate,)
                                    ),),
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Music',style: TextStyle(fontSize: 28,color: Colors.white.withOpacity(0.8)),),
                                  )),
                                ),
                              ),
                            ],
                    ),
                  ),
                ),
                FutureBuilder(
                    future: getApiData("${Query.text}","${Page.text}"),
                    builder:
                        (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator(color: Colors.grey,));
                      } else {
                        if (snapshot.hasError)
                          return Center(child: Text('Error: ${snapshot.error}'));
                        else {
                          return MasonryGridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: urlData!['results'].length,
                              crossAxisCount: 3,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  child: Card(
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    color: Colors.transparent,
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        18.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(8.0),),
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.network(
                                                          urlData!['results'][index]['urls']
                                                              ['full'],
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25),
                                                                color: Colors
                                                                    .deepPurple,
                                                              ),
                                                              width: 60,
                                                              child:
                                                                  MaterialButton(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  20)),
                                                                      onPressed:
                                                                          () async {
                                                                        int location =
                                                                            WallpaperManager
                                                                                .LOCK_SCREEN; //can be Home/Lock Screen
                                                                        var file =
                                                                            await DefaultCacheManager().getSingleFile(urlData!['results'][index]['urls']
                                                                                [
                                                                                'full']);
                                                                        bool result = await WallpaperManager.setWallpaperFromFile(
                                                                            file.path,
                                                                            location);
                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                          content: Text("Setting Wallpaper"),
                                                                        ));
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .lock,
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25),
                                                                color: Colors
                                                                    .deepPurple,
                                                              ),
                                                              width: 60,
                                                              child:
                                                                  MaterialButton(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  20)),
                                                                      onPressed:
                                                                          () async {
                                                                        int location =
                                                                            WallpaperManager
                                                                                .HOME_SCREEN; //can be Home/Lock Screen
                                                                        var file =
                                                                            await DefaultCacheManager().getSingleFile(urlData!['results'][index]['urls']
                                                                                [
                                                                                'full']);
                                                                        bool result = await WallpaperManager.setWallpaperFromFile(
                                                                            file.path,
                                                                            location);
                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                          content: Text("Setting Wallpaper"),
                                                                        ));
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .wallpaper,
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25),
                                                                color: Colors
                                                                    .deepPurple,
                                                              ),
                                                              width: 60,
                                                              child:
                                                                  MaterialButton(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  20)),
                                                                      onPressed:
                                                                          () async {
                                                                        ImageDownloader.downloadImage(urlData!['results'][index]['links']
                                                                                [
                                                                                'download']
                                                                            .toString());
                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                          content: Text("Downloading Wallpaper"),
                                                                        ));
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .download,
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                                  ),
                                                ));
                                      },
                                      child: Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          child: Image.network(
                                            urlData!['results'][index]['urls']['regular'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }
                    }),
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Select Page',style: TextStyle(color: Colors.grey,fontSize: 16),),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  Page.text = '1';
                                  getApiData(Query.text,Page.text);
                                });
                              },
                                child: Center(child: Text('1',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '2';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('2',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '3';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('3',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '4';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('4',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '5';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('5',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '6';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('6',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '7';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('7',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '8';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('8',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '9';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('9',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '10';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('10',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '11';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('11',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '12';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('12',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '13';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('13',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '14';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('14',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Page.text = '15';
                                    getApiData(Query.text,Page.text);
                                  });
                                },
                                child: Center(child: Text('15',style: TextStyle(color: Colors.grey,fontSize: 18),))),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
