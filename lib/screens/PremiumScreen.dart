import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/profile-bloc.dart';
import 'package:flutter_demo_application/blocs/profile-events.dart';
import 'package:flutter_demo_application/blocs/profile-states.dart';
import 'package:flutter_demo_application/repos/homeRepo.dart';
import 'package:flutter_demo_application/widgets/bottom_navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PremiumScreen extends StatefulWidget {
  PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            child: ListView(
              children: [
                const Center(
                    child: Text(
                  '1 month of premium for free',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                )),
                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 150.0,
                    viewportFraction: .8,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                            child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)),
                                    color: Color.fromARGB(255, 33, 33, 33),
                                  ),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'FREE',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'Ad breaks',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://images.unsplash.com/photo-1557683316-973673baf926?q=80&w=2029&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'PREMIUM',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Ad-free music listening',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ));
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "You can't upgrade to premium on this app. We know it's not ideal",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 33, 33, 33),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Spotofy Free',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Current Plan',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.normal),
                          )
                        ],
                      )),
                )
              ],
            )));
  }
}
