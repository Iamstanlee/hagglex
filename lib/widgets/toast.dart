import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hagglex/utils/res.dart';

class Toast {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;
  static void show(BuildContext context, String msg,
      {int duration = 2,
      int gravity = 0,
      bool isTimed = true,
      Color backgroundColor = const Color(0xAA000000),
      Color textColor = Colors.white,
      double backgroundRadius = 20,
      Border border}) {
    ToastView.dismiss();
    ToastView.createView(msg, context, isTimed, duration, gravity,
        backgroundColor, textColor, backgroundRadius, border);
  }

  static void dismiss() {
    ToastView.dismiss();
  }
}

class ToastView {
  static final ToastView _singleton = new ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;
  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }

  static void createView(
      String msg,
      BuildContext context,
      bool isTimed,
      int duration,
      int gravity,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border border) async {
    overlayState = Overlay.of(context);

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
          widget: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.zero,
                  border: border,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Text(msg,
                    softWrap: true,
                    style: TextStyle(fontSize: 13, color: textColor)),
              )),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
    await new Future.delayed(
        Duration(seconds: duration == null ? Toast.LENGTH_SHORT : duration));
    if (isTimed) dismiss();
  }
}

class ToastWidget extends StatelessWidget {
  ToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: gravity == 2 ? 50 : null,
        bottom: gravity == 0 ? 80 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}

void errorToast(BuildContext context, String msg) {
  Toast.show(context, msg, backgroundColor: R.Colors.errorColor);
}
