import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class SwipeableCard extends StatefulWidget {
  const SwipeableCard({super.key, required this.item, required this.onRemove});
  final Widget item;
  final dynamic onRemove;
  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard> {
  late final SwipableStackController _controller;

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SwipableStack(
      detectableSwipeDirections: const {
        SwipeDirection.down,
        SwipeDirection.left,
      },
      controller: _controller,
      itemCount: 1,
      allowVerticalSwipe: true,
      swipeAnchor: SwipeAnchor.bottom,
      onSwipeCompleted: (index, direction) {
        widget.onRemove();
      },
      horizontalSwipeThreshold: 1,
      verticalSwipeThreshold: 1,
      builder: (context, properties) {
        return widget.item;
      },
    );
  }
}
