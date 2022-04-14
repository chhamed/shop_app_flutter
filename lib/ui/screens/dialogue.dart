import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Dialogue extends StatefulWidget {
  const Dialogue({Key? key}) : super(key: key);

  @override
  _DialogueState createState() => _DialogueState();
}

class _DialogueState extends State<Dialogue> with TickerProviderStateMixin{
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   AlertDialog(
      title:  const Text('Order done successfully'),
      content: Lottie.network("https://assets9.lottiefiles.com/temp/lf20_33Ejte.json",
      repeat: false,
      reverse: false,
      animate: false,
      controller: _controller,

      ),

    );
  }

}
