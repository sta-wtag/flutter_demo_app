// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/home-bloc.dart';
import 'package:flutter_demo_application/blocs/home-events.dart';
import 'package:flutter_demo_application/blocs/home-states.dart';
import 'package:flutter_demo_application/repos/homeRepo.dart';
import 'package:flutter_demo_application/widgets/bottom_navbar.dart';
import 'package:flutter_demo_application/widgets/homepage_tab_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => HomeDataProvider(),
        child: BlocProvider(
          create: (context) => HomeBloc(
            RepositoryProvider.of<HomeDataProvider>(context),
          )..add(
              LoadHomePage(),
            ),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(
                    // child: CircularProgressIndicator(
                    //   color: Color.fromARGB(255, 123, 207, 112),
                    // ),
                    child: SpinKitFadingCube(
                  color: Color.fromARGB(255, 123, 207, 112),
                  size: 50.0,
                ));
              } else if (state is HomeLoadedState) {
                return TabContent(
                  onTapButton: (tab) {
                    BlocProvider.of<HomeBloc>(context)
                        .add(ChangeTabHomePage(tab));
                  },
                );
              } else if (state is TabChangedState) {
                if (state.tab == 'All') {
                  return Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: ListView(
                        children: [
                          TabContent(
                            onTapButton: (tab) {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeTabHomePage(tab));
                            },
                          ),
                          GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 3.0,
                              mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                              children: state.myLibraries.map((item) {
                                return ListTile(
                                  visualDensity:
                                      VisualDensity(horizontal: 0, vertical: 2),
                                  contentPadding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  tileColor: Color.fromARGB(255, 62, 61, 61),
                                  leading: Image.network(
                                    'https://wallpapers.com/images/high/imagine-dragons-2015-tour-poster-mjra28nakm8bz6v8.webp',
                                    fit: BoxFit.cover,
                                    // height: 50,
                                    // width: 60,
                                  ),
                                  title: Text(
                                    item,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                );
                              }).toList()),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'Get Your Top Five Tracks',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.topFive?.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Card(
                                color: Colors.amberAccent,
                                elevation: 10.0,
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.topFive?[index]?.album.images[0]
                                            .url,
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      state.topFive?[index].name,
                                      style:
                                          TextStyle(color: Colors.amberAccent),
                                    ),
                                    subtitle: Text(
                                      state.topFive?[index].type,
                                      style:
                                          TextStyle(color: Colors.amberAccent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'Recommended Tracks',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.recommended?.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Card(
                                color: Colors.amberAccent,
                                elevation: 10.0,
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.recommended?[index]?.album
                                            .images[0].url,
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      state.recommended?[index].name,
                                      style:
                                          TextStyle(color: Colors.amberAccent),
                                    ),
                                    subtitle: Text(
                                      state.recommended?[index].type,
                                      style:
                                          TextStyle(color: Colors.amberAccent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'Top 10 Songs',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.playlists?.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Card(
                                color: Colors.amberAccent,
                                elevation: 10.0,
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.playlists?[index]?.album.images[0]
                                            .url,
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      state.recommended?[index].name,
                                      style:
                                          TextStyle(color: Colors.amberAccent),
                                    ),
                                    subtitle: Text(
                                      state.playlists?[index].type,
                                      style:
                                          TextStyle(color: Colors.amberAccent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                } else if (state.tab == 'Music') {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 20.0),
                      child: Container(
                          child: ListView(
                        children: [
                          TabContent(
                            onTapButton: (tab) {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeTabHomePage(tab));
                            },
                          ),
                          GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 3.0,
                              mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                              children: state.myLibraries.map((item) {
                                return ListTile(
                                  visualDensity: const VisualDensity(
                                      horizontal: -1, vertical: 2),
                                  contentPadding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  tileColor:
                                      const Color.fromARGB(255, 62, 61, 61),
                                  leading: SizedBox(
                                      width: 60,
                                      height: 100,
                                      child: Image.network(
                                        'https://wallpapers.com/images/high/coldplay-ghost-stories-dove-album-art-zjre473efzckm2hz.webp',
                                        fit: BoxFit.cover,
                                      )),
                                  title: Text(
                                    item,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                );
                              }).toList()),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            color: Colors.amberAccent,
                            elevation: 10.0,
                            child: Container(
                                width: 405,
                                height: 500,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 142, 142, 140),
                                      Color.fromARGB(255, 68, 67, 67),
                                      Color.fromARGB(255, 34, 34, 34),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Pinkpantheres, Ice spice',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              Icon(Icons.volume_off_sharp)
                                            ],
                                          ),
                                        )),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                        ),
                                        CarouselSlider(
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            height: 200.0,
                                            aspectRatio: 0.8,
                                            viewportFraction: 1,
                                          ),
                                          items: [1, 2, 3, 4, 5].map((i) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      200,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                    image: NetworkImage(
                                                      'https://wallpapers.com/images/high/coldplay-ghost-stories-album-seals-h1fkjrm9yzb6gdff.webp',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  )),
                                                );
                                              },
                                            );
                                          }).toList(),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: ListTile(
                                            visualDensity: const VisualDensity(
                                                horizontal: -1, vertical: 2),
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            tileColor: const Color.fromARGB(
                                                255, 62, 61, 61),
                                            leading: SizedBox(
                                                width: 60,
                                                height: 100,
                                                child: Image.network(
                                                  'https://wallpapers.com/images/high/coldplay-ghost-stories-dove-album-art-zjre473efzckm2hz.webp',
                                                  fit: BoxFit.cover,
                                                )),
                                            title: const Text(
                                              'Imagine Dragons',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            subtitle: const Text(
                                              'Believer',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Positioned(
                                        bottom: 10,
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                      Icons.add_circle_outline),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(Icons.more_horiz),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '90 songs',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(Icons.play_circle)
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                )),
                          ),
                        ],
                      )));
                } else if (state.tab == 'Wrapped') {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 20.0),
                      child: Container(
                          child: Column(
                        children: [
                          TabContent(
                            onTapButton: (tab) {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeTabHomePage(tab));
                            },
                          ),
                          SizedBox(
                            height: 300,
                          ),
                          const Center(child: Text('Wrapped tab clicked'))
                        ],
                      )));
                } else {
                  return Text('null');
                }
              } else {
                return Text('error');
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 0,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
