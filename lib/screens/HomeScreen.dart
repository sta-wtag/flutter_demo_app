// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/home-bloc.dart';
import 'package:flutter_demo_application/blocs/home-events.dart';
import 'package:flutter_demo_application/blocs/home-states.dart';
import 'package:flutter_demo_application/repos/homeRepo.dart';
import 'package:flutter_demo_application/widgets/homepage_tab_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
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
                                  contentPadding: EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  tileColor: Color.fromARGB(255, 62, 61, 61),
                                  leading: Image.network(
                                    'https://images.unsplash.com/photo-1524419986249-348e8fa6ad4a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                    fit: BoxFit.fill,
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
                          child: Column(
                        children: [
                          TabContent(
                            onTapButton: (tab) {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeTabHomePage(tab));
                            },
                          ),
                          const Center(child: Text('Wrapped tab clicked'))
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
      bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.black.withOpacity(0.1),
          onDestinationSelected: (int index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, "/home");
              // Navigator.pushNamed(context, '/home');
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, "/search");
              // Navigator.pushNamed(context, '/search');
            }
          },
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.search_outlined,
                color: Color.fromARGB(255, 187, 185, 185),
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.library_music_sharp,
                color: Color.fromARGB(255, 187, 185, 185),
              ),
              label: 'My library',
            ),
            NavigationDestination(
              icon: ImageIcon(
                AssetImage('lib/assets/images/1217164_spotify_icon.png'),
                color: Color.fromARGB(255, 187, 185, 185),
              ),
              label: 'premium',
            ),
          ]),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
