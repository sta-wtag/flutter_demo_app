// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/search-events.dart';
import 'package:flutter_demo_application/blocs/search-states.dart';
import 'package:flutter_demo_application/blocs/search-bloc.dart';
import 'package:flutter_demo_application/repos/homeRepo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_demo_application/widgets/bottom_navbar.dart';
import 'dart:math' as math;

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => HomeDataProvider(),
        child: BlocProvider(
          create: (context) => SearchBloc(
            RepositoryProvider.of<HomeDataProvider>(context),
          )..add(
              LoadSearchPage(),
            ),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              print(state);
              if (state is SeachPageLoadedState) {
                return Scaffold(
                  body: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) => [
                            SliverAppBar(
                              backgroundColor:
                                  const Color.fromARGB(255, 18, 18, 18),
                              pinned: true,
                              floating: true,
                              snap: true,
                              centerTitle: false,
                              title: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/profile");
                                      },
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(
                                          state.user,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  const Text(
                                    'Search',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              bottom: PreferredSize(
                                preferredSize: Size.fromHeight(60),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0, bottom: 20.0),
                                    child: SearchAnchor(builder:
                                        (BuildContext context,
                                            SearchController controller) {
                                      return SearchBar(
                                        constraints: const BoxConstraints(
                                            minHeight: 40.0),
                                        controller: controller,
                                        shape: MaterialStateProperty.all(
                                            const ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          // side: BorderSide(color: Colors.pinkAccent),
                                        )),
                                        hintText:
                                            'What do you want to listen to?',
                                        padding: const MaterialStatePropertyAll<
                                                EdgeInsets>(
                                            EdgeInsets.symmetric(
                                                horizontal: 10.0)),
                                        onTap: () {
                                          controller.openView();
                                        },
                                        onChanged: (_) {
                                          controller.openView();
                                        },
                                        leading: const Icon(Icons.search),
                                        trailing: <Widget>[],
                                      );
                                    }, suggestionsBuilder:
                                        (BuildContext context,
                                            SearchController controller) {
                                      return List<ListTile>.generate(5,
                                          (int index) {
                                        final String item = 'item $index';
                                        return ListTile(
                                          title: Text(item),
                                          onTap: () {
                                            // setState(() {
                                            controller.closeView(item);
                                            // });
                                          },
                                        );
                                      });
                                    })),
                              ),
                            )
                          ],
                      body: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 0.0),
                          child: ListView(
                            children: [
                              const Text('Explore your genres'),
                              const SizedBox(height: 15.0),
                              Row(
                                children: [
                                  Card(
                                    color: Colors.amberAccent,
                                    elevation: 10.0,
                                    child: Container(
                                        width: 105,
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://w0.peakpx.com/wallpaper/233/923/HD-wallpaper-imagine-dragons-borntobeyours-danreynolds-dark-group-imaginedragons.jpg',
                                            ),
                                            fit: BoxFit.fill,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                        child: const Stack(
                                          children: [
                                            Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Text(
                                                  '#dance pop',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                          ],
                                        )),
                                  ),
                                  Card(
                                    color: Colors.amberAccent,
                                    elevation: 10.0,
                                    child: Container(
                                        width: 105,
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://w0.peakpx.com/wallpaper/940/338/HD-wallpaper-imagine-dragons-dragons-imagine-imagine-dragons-thunder-thunder-thunder-dragons-thunder-imagine-thunder-imagine-dragons.jpg',
                                            ),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                        child: const Stack(
                                          children: [
                                            Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Text(
                                                  '#western',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                          ],
                                        )),
                                  ),
                                  Card(
                                    color: Colors.amberAccent,
                                    elevation: 10.0,
                                    child: Container(
                                        width: 105,
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://w0.peakpx.com/wallpaper/910/484/HD-wallpaper-imagine-dragons-band-concert-danreynolds-demons-group-imaginedragons-music-radioactive-thunder.jpg',
                                            ),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                        child: const Stack(
                                          children: [
                                            Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Text(
                                                  '#motivation',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15.0),
                              const Text('Browse all'),
                              const SizedBox(height: 15.0),
                              GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.0,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 12.0,
                                  children: state.genres!.map((item) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: Color(
                                                (math.Random().nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                            .withOpacity(1.0),
                                        // image: DecorationImage(
                                        //   image: NetworkImage(
                                        //     'https://thumbs.dreamstime.com/z/random-picture-228881822.jpg?ct=jpeg',
                                        //   ),
                                        //   fit: BoxFit.cover,
                                        //   alignment: Alignment.topCenter,
                                        // ),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          item,
                                          style: const TextStyle(
                                              color: Colors.amberAccent),
                                        ),
                                      ),
                                    );
                                  }).toList()),
                            ],
                          ))),
                );
              }
              return const Center(
                  // child: CircularProgressIndicator(
                  //   color: Color.fromARGB(255, 123, 207, 112),
                  // ),
                  child: SpinKitFadingCube(
                color: Color.fromARGB(255, 123, 207, 112),
                size: 50.0,
              ));
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 1,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
