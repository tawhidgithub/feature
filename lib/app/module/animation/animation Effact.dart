import 'package:flutter/material.dart';

class AnimationEffect extends StatefulWidget {
  const AnimationEffect({super.key});

  @override
  State<AnimationEffect> createState() => _AnimationEffectState();
}

class _AnimationEffectState extends State<AnimationEffect>
    with TickerProviderStateMixin {
  late AnimationController _Box1Container;
  late AnimationController _Box2Container;
  late AnimationController _Box3Container;
  late AnimationController _opacityContainer;
  late ValueNotifier _hOpacityValueNotifier;
  late ValueNotifier _vOpacityValueNotifier;
  late ValueNotifier _btOpacityValueNotifier;
  late Animation<double> _horizontalMovement;
  late Animation<double> _verticalDrop;
  late Animation<double> _bouncingEffect;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hOpacityValueNotifier = ValueNotifier(1.0);
    _vOpacityValueNotifier = ValueNotifier(1.0);
    _btOpacityValueNotifier = ValueNotifier(0.0);
    _Box1Container = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _Box2Container = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _Box3Container = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _opacityContainer = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );




    _Box1Container.forward();
    _Box1Container.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _hOpacityValueNotifier.value = 0.0;

        _Box2Container.forward();
      }
    });
    _Box2Container.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _vOpacityValueNotifier.value = 0.0;

        _Box3Container.forward();
      }
    });
    _Box3Container.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _btOpacityValueNotifier.value = 1.0;

        _Box3Container.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _horizontalMovement = Tween<double>(begin: 0, end: 400).animate(
        CurvedAnimation(parent: _Box1Container, curve: Curves.easeIn));

    _verticalDrop = Tween<double>(begin: -100, end: MediaQuery.of(context).size.height-50).animate(
        CurvedAnimation(
            parent: _Box2Container,
            curve: Interval(0.3, 0.6, curve: Curves.easeIn)));

    _bouncingEffect = Tween<double>(begin:  MediaQuery.of(context).size.height-50, end: 200).animate(
        CurvedAnimation(
            parent: _Box3Container,
            curve: Interval(0.6, 1.0, curve: Curves.bounceOut)));


    return Scaffold(
      body: AnimatedBuilder(
          animation: Listenable.merge([_Box1Container,_Box2Container,_Box3Container]),
          builder: (_, child) {
            return Stack(
              children: [
                ValueListenableBuilder(
                  valueListenable: _hOpacityValueNotifier,
                  builder: (_, opacity, child) {
                    return Positioned(
                        top: 100,
                        left: _horizontalMovement.value,
                        child: Opacity(opacity: opacity, child: Ball()));
                  },
                ), // right to left
                ValueListenableBuilder(
                  valueListenable: _vOpacityValueNotifier,
                  builder: (_, opacity, child) {
                    return Positioned(
                        top: _verticalDrop.value,
                        child: Opacity(opacity: opacity, child: Ball()));
                  },
                ), // top to bottom
                ValueListenableBuilder(
                  valueListenable: _btOpacityValueNotifier,
                  builder: (_, opacity, child) {
                    return Positioned(
                        top: _bouncingEffect.value,
                                                child: Opacity(opacity: opacity, child: Ball()));
                  },
                ), // bottom to top
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _Box1Container.dispose();
    _Box2Container.dispose();
    _Box3Container.dispose();
    _opacityContainer.dispose();
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.red,
      ),
    );
  }
}
