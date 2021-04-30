import 'package:flutter/material.dart';

class Busy extends StatelessWidget {
  final Widget child;
  final bool busy;
  final String msg;
  Busy({@required this.child, @required this.busy, this.msg = 'Loading...'})
      : assert(busy != null && child != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          child,
          busy
              ? Stack(
                  children: [
                    ModalBarrier(
                        dismissible: false,
                        color: Colors.black.withOpacity(0.5)),
                    Center(
                      child: Text('$msg',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.white)),
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
