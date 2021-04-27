import 'package:flutter/material.dart';

///
/// push a new route by passing a route widget
/// if `popPrev` is `true`, it would pop off the previous routes off the stack
///
Future<T> push<T>(BuildContext context,
    {Widget route, bool popPrev = false}) async {
  if (popPrev)
    return await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => route), (_) => _.isFirst);
  return await Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => route));
}

///
/// pop the current widget off the route stack
///
void pop<T>(BuildContext context, {T result}) {
  Navigator.of(context).pop(result);
}
