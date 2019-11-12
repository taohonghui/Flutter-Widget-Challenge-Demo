import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatefulWidget {
  VoidCallback onSlideComplete;
  VoidCallback onSlideCancel;

  SlideCallback onSlideStart;

  final List<Widget> hideWidgets;

  AnimationController animationController;

  _SlideItemState state;
  Widget slideWidget;

  double hideButtonWidth;

  int id;

  SlideItem(
      {Key key,
      @required this.slideWidget,
      @required this.hideWidgets,
      this.onSlideComplete,
      this.onSlideStart,
      this.onSlideCancel,
      this.id,
      this.animationController,
      @required this.hideButtonWidth})
      : super(key: key);

  @override
  _SlideItemState createState() => state = _SlideItemState();
}

class _SlideItemState extends State<SlideItem> with TickerProviderStateMixin {
  double maxDragDistance;

  double translateX = 0;
  final Map<Type, GestureRecognizerFactory> gestures =
      <Type, GestureRecognizerFactory>{};

  AnimationController _animationController;

  List<Widget> _warpHideWidgets;

  @override
  void initState() {
    print("最大长度" + this.widget.hideWidgets.length.toString());
    maxDragDistance =
        this.widget.hideButtonWidth * this.widget.hideWidgets.length;
    _warpHideWidgets = widget.hideWidgets;
    print("最大宽度为" + maxDragDistance.toString());

    //动画控制器
    if (this.widget.animationController == null) {
      _animationController = AnimationController(
          lowerBound: -maxDragDistance,
          upperBound: 0,
          vsync: this,
          duration: Duration(milliseconds: 300))
        ..addListener(() {
          translateX = _animationController.value;
          setState(() {});
        });
    } else {
      _animationController = this.widget.animationController;
    }
    //注册横向手势
    gestures[HorizontalDragGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<HorizontalDragGestureRecognizer>(
      () => HorizontalDragGestureRecognizer(debugOwner: this),
      (HorizontalDragGestureRecognizer instance) {
        instance
          ..onDown = onHorizontalDragDown
          ..onUpdate = onHorizontalDragUpdate
          ..onEnd = onHorizontalDragEnd;
      },
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        //返回键的处理
        child: Listener(
          //父组件的监听
          onPointerDown: (PointerDownEvent event) {
            close();
          },
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _warpHideWidgets,
              )),
              RawGestureDetector(
                gestures: gestures,
                child: Transform.translate(
                  offset: Offset(translateX, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: widget.slideWidget,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onWillPop: () async {
          if (translateX != 0) {
            close();
            return false;
          }
          return true;
        });
  }

  void onHorizontalDragDown(DragDownDetails details) {
    if (widget.onSlideStart != null) widget.onSlideStart.call(widget.id);
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    translateX = (translateX + details.delta.dx).clamp(-maxDragDistance, 0.0);
    setState(() {});
  }

  void onHorizontalDragEnd(DragEndDetails details) {
    _animationController.value = translateX;
    if (details.velocity.pixelsPerSecond.dx > 200) {
      close();
    } else if (details.velocity.pixelsPerSecond.dx < -200) {
      open();
    } else if (details.velocity.pixelsPerSecond.dx == 0) {
      close();
    } else {
      if (translateX.abs() > maxDragDistance / 10) {
        open();
      } else {
        close();
      }
    }
  }

  void open() {
    if (translateX != -maxDragDistance)
      _animationController.animateTo(-maxDragDistance).then((_) {
        print("展开完成");
        if (widget.onSlideComplete != null) widget.onSlideComplete.call();
      });
  }

  void close() {
    if (translateX != 0)
      _animationController.animateTo(0).then((_) {
        print("关闭完成");
        if (widget.onSlideCancel != null) widget.onSlideCancel.call();
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

typedef ItemWidgetBuilder = List<Widget> Function(BuildContext context);
typedef SlideCallback = void Function(int id);
