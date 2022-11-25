import 'package:flutter/material.dart';

class Breather extends StatefulWidget {
  const Breather({super.key});

  

  @override
  State<Breather> createState() => _BreatherState();
}

class _BreatherState extends State<Breather> with TickerProviderStateMixin {
 late AnimationController animController;
  double animValue = 0;

  @override
  void initState() {
    
    super.initState();
    functionAnimation();
  }

  @override
  void dispose() {
    if (animController.status == AnimationStatus.forward ||
        animController.status == AnimationStatus.dismissed) {
      animController.notifyStatusListeners(AnimationStatus.dismissed);
    }
    animController.dispose();
    
    super.dispose();
  }

  void functionAnimation() {
    animController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animController.stop();
      } else if (status == AnimationStatus.dismissed) {
        animController.forward();
       
      }
    });

    animController.addListener(() {
      setState(() {
        animValue = animController.value;
      });
    });

    animController.forward();
  }


  @override
  Widget build(BuildContext context) {
    final size = 350.0 - animValue * 200.0;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 148, 255, 255),
                borderRadius: BorderRadius.circular(175),
              ),
            ),
          ],
        ),
        
      ),
      
    );
  }
}