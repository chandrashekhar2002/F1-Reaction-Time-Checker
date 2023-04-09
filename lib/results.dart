import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  double startMinutes,
      EndMinutes,
      startTimeSeconds,
      endTimeSeconds,
      startTimeMilli,
      endTimeMilli;

  resultScreen(
      this.startMinutes,
      this.EndMinutes,
      this.startTimeSeconds,
      this.endTimeSeconds,
      this.startTimeMilli,
      this.endTimeMilli,
      this.lightsOfftime);

  int lightsOfftime;

  @override
  Widget build(BuildContext context) {
    double convertStartTime =
        startMinutes * 60000 + startTimeSeconds * 1000 + startTimeMilli;
    double convertEndTime =
        EndMinutes * 60000 + endTimeSeconds * 1000 + endTimeMilli;

    double resultTime =
        ((convertEndTime - convertStartTime) / 1000) - lightsOfftime;

    String resultString = resultTime.toStringAsFixed(5);

    bool old = false;
    resultTime > 0.5 ? old = false : old = true;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text('Old/Young'),
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text('Start Time : ${convertStartTime / 1000}'),
            // Text('End Time : ${convertEndTime / 1000}'),
            const Text(
              'Your Response Time',
              style: TextStyle(fontSize: 20),
            ),

            Text(
              resultString,
              style: TextStyle(
                  color: old ? Colors.lightGreen : Colors.redAccent,
                  fontSize: 30),
            ),

            (!old && resultTime > 0)
                ? const Text(
                    'You are too Slow :( ',
                    style: TextStyle(fontSize: 25, color: Colors.orange),
                  )
                : const Text(
                    'You are Quick! :) ',
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),

            Text(
              resultTime < 0 ? 'Too Fast C\'mon' : '',
              style: const TextStyle(color: Colors.redAccent, fontSize: 23),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                child: const Text(
                  'Play Again',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
