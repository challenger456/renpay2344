import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class RecieveScreen extends StatefulWidget {
  const RecieveScreen({super.key});

  @override
  State<RecieveScreen> createState() => _RecieveScreenState();
}

class _RecieveScreenState extends State<RecieveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RippleAnimation(
          child: CircleAvatar(
            minRadius: 75,
            maxRadius: 75,
            backgroundImage: AssetImage('asset/profile.png'),
          ),
          color: Colors.deepPurple,
          delay: const Duration(milliseconds: 300),
          repeat: true,
          minRadius: 120,
          ripplesCount: 10,
          duration: const Duration(milliseconds: 6 * 300),
        ),
      ),
    );
  }
}
