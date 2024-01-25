import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/home-bloc.dart';
import 'package:flutter_demo_application/blocs/home-states.dart';

class InfoCard extends StatefulWidget {
  String title = '';
  String subtitle = '';
  String chipTitle = '';
  String image_url =
      'https://images.unsplash.com/photo-1557683316-973673baf926?q=80&w=2029&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  InfoCard(
      {required this.title,
      required this.subtitle,
      required this.chipTitle,
      required this.image_url});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        // width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.image_url,
            ),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Stack(children: [
          Positioned(
              top: 20,
              left: 14.0,
              child: Container(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 209, 208, 208),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  child: Text(
                    widget.chipTitle,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0),
                  ))),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  textAlign: TextAlign.center,
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          )),
        ]));
  }
}
