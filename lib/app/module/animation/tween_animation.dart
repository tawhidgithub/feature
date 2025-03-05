import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _container;
  late Animation<num> _animation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _container =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat(reverse: true);
    _animation = Tween(begin: 50.0, end: 200.0).animate(_container)..addListener((){
      setState(() {

      });
    });

    _curveAnimation=CurvedAnimation(parent: _container, curve: Curves.bounceInOut);
    
/// multi color animation
    _colorAnimation =TweenSequence<Color?>(
        [
          TweenSequenceItem(
              tween: ColorTween(begin: Colors.redAccent,end: Colors.green),
              weight: 1.0,
          ),TweenSequenceItem(
              tween: ColorTween(begin: Colors.redAccent,end: Colors.green),
              weight: 1.0,
          ),TweenSequenceItem(
              tween: ColorTween(begin: Colors.yellow,end: Colors.blue),
              weight: 1.0,
          ),TweenSequenceItem(
              tween: ColorTween(begin: Colors.black26,end: Colors.orange),
              weight: 1.0,
          ),TweenSequenceItem(
              tween: ColorTween(begin: Colors.pink,end: Colors.lightBlueAccent),
              weight: 1.0,
          ),TweenSequenceItem(
              tween: ColorTween(begin: Colors.purple,end: Colors.orangeAccent),
              weight: 1.0,
          ),
        ]).animate(_container);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _container.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:ScaleTransition(scale: _curveAnimation,child: Container(
          height: _animation.value.toDouble(),
          width: _animation.value.toDouble(),
          color: _colorAnimation.value ?? Colors.redAccent,
        ),)
        ) ,
      );

  }
}

// Roted Animation
//
// AnimatedBuilder(
// animation: _animation,
// builder: (_, child) {
// return Transform.rotate(
// angle: _animation.value.toDouble(),
// child: child,
// );
// },
// child: Container(
// height: 10,
// width: 400,
// color: Colors.red,
// ),
// )