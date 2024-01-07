import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/profile-bloc.dart';
import 'package:flutter_demo_application/blocs/profile-events.dart';
import 'package:flutter_demo_application/blocs/profile-states.dart';
import 'package:flutter_demo_application/repos/homeRepo.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        padding: EdgeInsets.only(left: 30, top: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    state.user,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Sadia Tabassum',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text('0 followers',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('0 following',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(70.0, 0.0),
                                    elevation: 8, // Controls the shadow depth
                                    primary:
                                        Colors.transparent, // Background color
                                    onPrimary: Colors.white, // Text color
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.0,
                                          color: const Color.fromARGB(
                                              255, 178, 176, 176)),
                                      borderRadius: BorderRadius.circular(
                                          40.0), // Customize the border radius
                                    ),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      backgroundColor:
                                          const Color.fromARGB(31, 51, 50, 50),
                                      builder: (BuildContext context2) {
                                        return SizedBox(
                                          height: 800,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Container(
                                                color: Color.fromARGB(
                                                    255, 45, 44, 44),
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context2),
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          color: Colors
                                                              .white, // Text color
                                                          fontSize:
                                                              12.0, // Text size
                                                        ),
                                                      ),
                                                    ),
                                                    Text('Edit Profile'),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context2),
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                          color: const Color
                                                              .fromARGB(
                                                              255,
                                                              158,
                                                              156,
                                                              156), // Text color
                                                          fontSize:
                                                              12.0, // Text size
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30.0,
                                              ),
                                              Stack(
                                                children: [
                                                  Center(
                                                    child: CircleAvatar(
                                                      radius: 70,
                                                      backgroundImage:
                                                          NetworkImage(
                                                        state.user,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top:
                                                          90.0, // Adjust the top position
                                                      left: 220.0,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          BlocProvider.of<
                                                                      ProfileBloc>(
                                                                  context)
                                                              .add(
                                                                  UploadImage());
                                                        },
                                                        icon: Icon(Icons.edit),
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.ios_share,
                                    color: Color.fromARGB(255, 178, 176, 176),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ));
                  }
                  if (state is ImageUploadedState) {
                    return Padding(
                        padding: EdgeInsets.only(left: 30, top: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    state.user,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Sadia Tabassum',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text('0 followers',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('0 following',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(70.0, 0.0),
                                    elevation: 8, // Controls the shadow depth
                                    primary:
                                        Colors.transparent, // Background color
                                    onPrimary: Colors.white, // Text color
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.0,
                                          color: const Color.fromARGB(
                                              255, 178, 176, 176)),
                                      borderRadius: BorderRadius.circular(
                                          40.0), // Customize the border radius
                                    ),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      backgroundColor:
                                          const Color.fromARGB(31, 51, 50, 50),
                                      builder: (BuildContext context2) {
                                        return SizedBox(
                                          height: 800,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Container(
                                                color: Color.fromARGB(
                                                    255, 45, 44, 44),
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context2),
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          color: Colors
                                                              .white, // Text color
                                                          fontSize:
                                                              12.0, // Text size
                                                        ),
                                                      ),
                                                    ),
                                                    Text('Edit Profile'),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context2),
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                          color: const Color
                                                              .fromARGB(
                                                              255,
                                                              158,
                                                              156,
                                                              156), // Text color
                                                          fontSize:
                                                              12.0, // Text size
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30.0,
                                              ),
                                              Stack(
                                                children: [
                                                  Center(
                                                    child: CircleAvatar(
                                                      radius: 70,
                                                      backgroundImage:
                                                          NetworkImage(
                                                        state.user,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top:
                                                          90.0, // Adjust the top position
                                                      left: 220.0,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          BlocProvider.of<
                                                                      ProfileBloc>(
                                                                  context)
                                                              .add(
                                                                  UploadImage());
                                                        },
                                                        icon: Icon(Icons.edit),
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.ios_share,
                                    color: Color.fromARGB(255, 178, 176, 176),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ));
                  }
                  return Text('djd');
                }))));
  }
}
