import 'package:flutter/material.dart';

///
/// push a new route by passing a route widget
/// if `popPrev` is `true`, it would pop off the previous routes off the stack
/// and set the first route to the current
/// `popOFF` is `true`, it clears the route stack and exit the app if
/// the back button is pressed
///
Future<T> push<T>(BuildContext context,
    {Widget route, bool popPrev = false, bool popOFF = false}) async {
  if (popPrev)
    return await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => route), (_) => _.isFirst);
  if (popOFF)
    return await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => route), (_) => false);
  return await Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => route));
}

///
/// pop the current widget off the route stack
///
void pop<T>(BuildContext context, {T result}) {
  Navigator.of(context).pop(result);
}
