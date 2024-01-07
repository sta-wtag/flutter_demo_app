import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/blocs/home-bloc.dart';
import 'package:flutter_demo_application/blocs/home-states.dart';

class TabContent extends StatefulWidget {
  final Function onTapButton;

  TabContent({required this.onTapButton});

  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is TabChangedState) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/profile");
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
                GestureDetector(
                  onTap: () => {widget.onTapButton('All')},
                  child: Container(
                    width: 50,
                    height: 24,
                    decoration: BoxDecoration(
                        color: state.tab == 'All'
                            ? Color.fromARGB(255, 123, 207, 112)
                            : Color.fromARGB(255, 40, 42, 40),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                        child: Text(
                      'All',
                      style: TextStyle(
                          color:
                              state.tab == 'All' ? Colors.black : Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                GestureDetector(
                  onTap: () => {widget.onTapButton('Music')},
                  child: Container(
                    width: 60,
                    height: 24,
                    decoration: BoxDecoration(
                        color: state.tab == 'Music'
                            ? Color.fromARGB(255, 123, 207, 112)
                            : Color.fromARGB(255, 40, 42, 40),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                        child: Text(
                      'Music',
                      style: TextStyle(
                          color: state.tab == 'Music'
                              ? Colors.black
                              : Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                GestureDetector(
                    onTap: () => {widget.onTapButton('Wrapped')},
                    child: Container(
                      width: 74,
                      height: 24,
                      decoration: BoxDecoration(
                          color: state.tab == 'Wrapped'
                              ? Color.fromARGB(255, 123, 207, 112)
                              : Color.fromARGB(255, 40, 42, 40),
                          borderRadius: BorderRadius.circular(20.0),
                          border: state.tab == 'Wrapped'
                              ? Border.all(width: 0, color: Colors.cyan)
                              : Border.all(width: 1, color: Colors.cyan)),
                      child: Center(
                          child: Text(
                        'Wrapped',
                        style: TextStyle(
                            color: state.tab == 'Wrapped'
                                ? Colors.black
                                : Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )),
                    )),
              ],
            ));
      }
      return Text('test');
    });
  }
}
