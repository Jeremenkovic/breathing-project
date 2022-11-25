
import 'package:audioplayers/audioplayers.dart';
import 'package:breathing/breather.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'custom_timer_painer.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> 
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  late AnimationController lottiecontroller;
  late AnimationController lottiecontroller1;
  late AnimationController lottiecontroller2;
  late AnimationController lottiecontroller3;
  int cont = 0;
  

  List<Duration> animationDuration = [
    const Duration(seconds: 5),
    const Duration(seconds: 5),
    const Duration(seconds: 5),
    const Duration(seconds: 5),
  ];

  String get timerString {
    Duration duration =
        controller.duration! * controller.value + const Duration(milliseconds: 999);
    return '${duration.inSeconds}';
  }

  String get timerText {
    if (controller == controller1) {
      return 'Inhale';
    } else if (controller == controller2) {
      return 'Hold';
    }
    if (controller == controller3) {
      return 'Exhale';
    }
    return 'Prepare!';
  }

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    lottiecontroller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    lottiecontroller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    lottiecontroller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );


    

    controller = controller1;
    lottiecontroller = lottiecontroller1;

    controller1.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          controller = controller2;
        });
        controller2.reverse(from: 1);
      }
    });

    controller2.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          controller = controller3;
        });
        controller3.reverse(from: 1);
      }
    });

    controller3.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          controller = controller1;
        });
        controller1.reverse(from: 1);
      }
    });


    lottiecontroller1.addStatusListener((AnimationStatus status) { 
      if (status == AnimationStatus.dismissed) {
         setState(() {
           lottiecontroller = lottiecontroller2;
         });
         lottiecontroller2.stop();
      }



    });
    lottiecontroller2.addStatusListener((AnimationStatus status) { 
      if (status == AnimationStatus.dismissed) {
         setState(() {
           lottiecontroller = lottiecontroller3;
         });
         lottiecontroller3.reverse(from: 1.0);
      }



    });
    lottiecontroller3.addStatusListener((AnimationStatus status) { 
      if (status == AnimationStatus.completed) {
         setState(() {
           lottiecontroller = lottiecontroller1;
         });
         lottiecontroller1.forward(from: 0);
      }



    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 231, 253),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Stack(
                              children: <Widget>[
                                
                                Positioned.fill(
                                  child: CustomPaint(
                                    painter: CustomTimerPainter1(
                                      animation: controller1,
                                      backgroundColor: const Color.fromARGB(255, 151, 240, 128),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: CustomPaint(
                                    painter: CustomTimerPainter2(
                                      animation: controller2,
                                      backgroundColor: const Color.fromARGB(255, 151, 240, 128),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: CustomPaint(
                                    painter: CustomTimerPainter3(
                                      animation: controller3,
                                      backgroundColor: const Color.fromARGB(255, 151, 240, 128),
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.bottomCenter,                         
                                  child: Stack(
                                   

                                    children: <Widget>[  
                                      Positioned.fill(
      child: Align(
        alignment: Alignment.centerRight,

        child: Container(height: 400,
        child: Lottie.asset('assets/breathing.json',controller: lottiecontroller),
        ),
        
                                       
                                       
                                        // child: Breather(),
                                        ),),    
                                      Positioned(   
                                        left:150.0,
                                        bottom:200.0,
                                        child:                            
                                      Text(
                                        timerText,
                                        style: const TextStyle(
                                          fontSize: 30.0,
                                          color: Color(0xFF1D1E33),
                                        ),
                                      ),),
                                      Positioned(   
                                        left:160.0,
                                        bottom:70.0,
                                        child: 
                                      Text(
                                        timerString,
                                        style: const TextStyle(
                                          fontSize: 112.0,
                                          color: Color(0xFF1D1E33),
                                        ),
                                      ),),
   
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return FloatingActionButton.extended(
                                onPressed: () {
                                  if (controller.isAnimating)
                                    controller.stop();
                                    
                                  else {
                                    controller.reverse(
                                        from: controller.value == 0.0
                                            ? 1.0
                                            : controller.value);
                                  }  
                                  if (lottiecontroller.isAnimating)
                                    lottiecontroller.stop();
                                    
                                     
                                  else {
                                    lottiecontroller.forward(from:lottiecontroller.value);
                                  }   

                                  final player = AudioCache(); 
                                  //player.play('');  add audio file to assets                   
                                },
                                icon: Icon(controller.isAnimating
                                    ? Icons.pause
                                    : Icons.play_arrow),
                                label: Text(
                                    controller.isAnimating ? "Pause" : "Play"));
                          }),
                          
                    ],
                    
                  ),
                ),
              ],
            );
          }),
    );
  }
}