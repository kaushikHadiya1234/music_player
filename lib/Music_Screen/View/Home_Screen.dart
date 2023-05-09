import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Music_Screen/Provider/Music_Provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MusicProvider? pt;
  MusicProvider? pf;

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<MusicProvider>(context, listen: false);
    pt = Provider.of<MusicProvider>(context, listen: true);
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 5.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(
                              Icons.mic,
                              color: Colors.grey,
                            ),
                            hintText: "Search Song",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 13.h,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 15.h,
                        width: 30.5.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: pf!.topList[index].c1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                pf!.topList[index].icon,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${pf!.topList[index].name}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: pf!.topList.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    PopupMenuButton(itemBuilder: (context) => [
                      PopupMenuItem(child: Text("All Song"),),
                      PopupMenuItem(child: Text("Favorite Song"),)
                    ],);
                  },
                  child: Row(
                    children: [
                      Text(
                        "All songs",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.purple,
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Songs"),
                  Tab(
                    text: "Artists",
                  ),
                  Tab(
                    text: "Albums",
                  ),
                  Tab(
                    text: "Folders",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 42.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 9.w,
                            width: 9.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: [
                                  Colors.purple,
                                  Colors.purpleAccent,
                                ])),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "shuffle playback",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 17.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.data_exploration,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.menu_open_rounded,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        pt!.click=index;
                        Navigator.pushNamed(context, 'play',arguments: index);
                      },
                      child: ListTile(
                        leading: Container(
                          height: 12.w,
                          width: 12.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.purple[100]),
                          child: Icon(
                            Icons.audiotrack,
                            size: 30,
                            color: Colors.purple[300],
                          ),
                        ),
                        title: Text("Music ${index+1}",style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold),),
                        subtitle: Text("Unknown Artist | Unknown..."),
                        trailing: Icon(Icons.more_vert),
                      ),
                    );
                  },
                  itemCount: pf!.MusicList.length,
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.headphones), label: "My music"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.audiotrack), label: "Online"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_outline_sharp), label: "Watch"),
            ],
          ),
        ),
      ),
    );
  }
}
