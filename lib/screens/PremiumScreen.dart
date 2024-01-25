import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/profile-bloc.dart';
import 'package:flutter_demo_application/blocs/profile-events.dart';
import 'package:flutter_demo_application/blocs/profile-states.dart';
import 'package:flutter_demo_application/repos/homeRepo.dart';
import 'package:flutter_demo_application/widgets/bottom_navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_demo_application/widgets/info_card.dart';

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
                                  color: Color.fromARGB(255, 50, 50, 51),
                                ),
                                child: const Column(children: [
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
                                decoration: const BoxDecoration(
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
                                child: const Column(children: [
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
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.9),
                child: Center(
                  child: Text(
                    "You can't upgrade to premium on this app. We know it's not ideal",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.9),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 50, 50, 51),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Spotofy Free',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Current Plan',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        )),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: InfoCard(
                    title: 'Premium Individual',
                    subtitle:
                        '1 month of premium for free . Ad-free music listening . Download to listen offline . Unlimited skips . On-demand playback . Cancel anytime',
                    chipTitle: 'FREE FOR 1 MONTH',
                    image_url:
                        'https://images.unsplash.com/photo-1557683316-973673baf926?q=80&w=2029&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: InfoCard(
                      image_url:
                          'https://img.freepik.com/free-photo/vivid-blurred-colorful-background_58702-2583.jpg?w=1380&t=st=1706173957~exp=1706174557~hmac=b27aaf413fbcd2497ed4a95900069e6f8d7f9b16953e57505d16aa3c1b344e72',
                      title: 'Premium Student',
                      subtitle:
                          '1 month of premium for free . Save up tp 50% . Prepaid Plan available . Ad-free music listening . Unlimited skips . On-demand playback . Cancel anytime',
                      chipTitle: 'FREE FOR 1 MONTH')),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: InfoCard(
                      image_url:
                          'https://img.freepik.com/free-photo/abstract-luxury-gradient-blue-background-smooth-dark-blue-with-black-vignette-studio-banner_1258-72781.jpg?w=996&t=st=1706174465~exp=1706175065~hmac=9533403a9e3a3186c92bc9526f333486310cc2b61e15723488a47f361dccbf91',
                      title: 'Premium Duo',
                      subtitle:
                          '2 Premium accounts  . Ad-free music listening . Unlimited skips . On-demand playback . Subcribe and auto-renew monthly . Or pay once for 1, 3, 6 or 12 months',
                      chipTitle: 'FREE FOR 1 MONTH')),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: InfoCard(
                      image_url:
                          'https://img.freepik.com/free-photo/background-gradient-lights_23-2149304985.jpg?w=1380&t=st=1706173911~exp=1706174511~hmac=d0175472cda8bca528c2d7e5609d1aea5e2f7c121b4f7eb81245e04ea36b979b',
                      title: 'Premium Family',
                      subtitle:
                          '6 Premium accounts, for families who live together . Block explicit music . Prepaid Plan available . Ad-free music listening . Unlimited skips . On-demand playback . Subscribe auto-renew monthly . Or pay once for 1, 3, 6 or 12 months',
                      chipTitle: 'FREE FOR 1 MONTH')),
            ],
          )),
      bottomNavigationBar: BottomNavbar(
        currentIndex: 3,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
