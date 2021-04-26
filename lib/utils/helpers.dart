import 'package:flutter/material.dart';

///
/// push a new route by passing a route widget
///
Future<T> push<T>(BuildContext context, {Widget route}) async {
  return await Navigator.of(context).push(MaterialPageRoute(builder: (_) => route));
}

///
/// pop the current widget off the route stack
///
void pop<T>(BuildContext context, {T result}) {
  Navigator.of(context).pop(result);
}
