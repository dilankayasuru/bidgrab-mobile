import 'dart:async';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final String startingDate;
  final String endDate;

  const Countdown(
      {super.key, required this.startingDate, required this.endDate});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late DateTime _endDate;
  late Duration _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _endDate = DateTime.parse(widget.endDate);
    _remainingTime = _endDate.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = _endDate.difference(DateTime.now());
        if (_remainingTime.isNegative) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingTime.isNegative) {
      return const Text('Auction ended');
    }

    final days = _remainingTime.inDays;
    final hours = _remainingTime.inHours % 24;
    final minutes = _remainingTime.inMinutes % 60;
    final seconds = _remainingTime.inSeconds % 60;

    return Text(
      'Ends in: ${days}d ${hours}h ${minutes}m ${seconds}s',
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
