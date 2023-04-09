import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:sastaspotify/results.dart';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  String url = 'https://www.havells.com/#gref';
  int randomNumber = 0, temp = 0;
  bool trigger = false;
  late DateTime timeStart, timeEnd;

  @override
  void initState() {
    Random randomNumber = Random();
    temp = 6 + randomNumber.nextInt(5);
    Future.delayed(
      Duration(seconds: temp),
      () {
        setState(() {
          trigger = true;
        });
      },
    );
    timeStart = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(temp);
    print(timeStart);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Let\'s see u are old or not'),
          centerTitle: true),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black87,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Let\'s check Your response time ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildLights(),
                  _buildLights(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  timeEnd = DateTime.now();
                  print(timeEnd);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => resultScreen(
                              timeStart.minute.toDouble(),
                              timeEnd.minute.toDouble(),
                              timeStart.second.toDouble(),
                              timeEnd.second.toDouble(),
                              timeStart.millisecond.toDouble(),
                              timeEnd.millisecond.toDouble(),
                              temp)));
                });
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 80),
                  height: MediaQuery.of(context).size.height / 2 - 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLights() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DelayedWidget(
          delayDuration: const Duration(seconds: 1),
          animation: DelayedAnimations.SLIDE_FROM_TOP,
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (trigger) ? Colors.black : Colors.red,
            ),
          ),
        ),
        DelayedWidget(
          delayDuration: const Duration(seconds: 2),
          animation: DelayedAnimations.SLIDE_FROM_TOP,
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: trigger ? Colors.black : Colors.red,
              )),
        ),
        DelayedWidget(
          delayDuration: const Duration(seconds: 3),
          animation: DelayedAnimations.SLIDE_FROM_TOP,
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: trigger ? Colors.black : Colors.red,
              )),
        ),
        DelayedWidget(
          delayDuration: const Duration(seconds: 4),
          animation: DelayedAnimations.SLIDE_FROM_TOP,
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: trigger ? Colors.black : Colors.red,
              )),
        ),
        DelayedWidget(
          delayDuration: const Duration(seconds: 5),
          animation: DelayedAnimations.SLIDE_FROM_TOP,
          child: GestureDetector(
            onTap: trigger
                ? () {
                    setState(() {
                      print('triggered');
                    });
                  }
                : null,
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: trigger ? Colors.black : Colors.red,
                )),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
