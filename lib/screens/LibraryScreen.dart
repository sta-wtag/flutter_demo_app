import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/profile-bloc.dart';
import 'package:flutter_demo_application/blocs/profile-events.dart';
import 'package:flutter_demo_application/blocs/profile-states.dart';
import 'package:flutter_demo_application/repos/homeRepo.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          body: RepositoryProvider(
              create: (context) => HomeDataProvider(),
              child: BlocProvider(
                  create: (context) => ProfileBloc(
                        RepositoryProvider.of<HomeDataProvider>(context),
                      )..add(
                          LoadProfilePage(),
                        ),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                    if (state is ProfileLoadedState) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, "/profile");
                                          },
                                          child: CircleAvatar(
                                            radius: 14,
                                            backgroundImage: NetworkImage(
                                              state.user,
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'My Library',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
                                    ]),
                                const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: Colors.grey,
                                      ),
                                    ]),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 40, 42, 40),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Center(
                                        child: Text(
                                      'Playlists',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 173, 172, 172),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 40, 42, 40),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Center(
                                        child: Text(
                                      'Artists',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 173, 172, 172),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: -1, vertical: 2),
                              leading: SizedBox(
                                  width: 60,
                                  height: 100,
                                  child: Image.network(
                                    'https://img.freepik.com/free-photo/vivid-blurred-colorful-background_58702-2655.jpg?w=826&t=st=1705405711~exp=1705406311~hmac=e096034f092b7531630e2762b0ce3fbcf0f6d3144e377a30e7dc4f9f5d9b068a',
                                    fit: BoxFit.cover,
                                  )),
                              title: const Text(
                                'Liked Songs',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Row(
                                children: [
                                  Transform.rotate(
                                    angle: 45,
                                    child: const Icon(
                                      Icons.push_pin,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Playlist',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '. 123 songs',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Text('djd');
                  }))))
    ]);
  }
}
