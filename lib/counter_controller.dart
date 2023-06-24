import 'package:flutter/material.dart';

class CounterController extends ValueNotifier<int> {
  CounterController() : super(0);

  // make a static instance of this class
  static final CounterController instance = CounterController();

  get counter => value;
  void increment() => value++;

  void decrement() => {
        if (value > 0) {value--}
      };
}
