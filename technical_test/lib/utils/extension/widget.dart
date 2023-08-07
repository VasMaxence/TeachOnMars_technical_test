import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension WidgetUtils on Widget {
  Widget padding(EdgeInsetsGeometry padding) => Padding(
        padding: padding,
        child: this,
      );

  Widget margin(EdgeInsetsGeometry margin) => Container(
        margin: margin,
        child: this,
      );

  Widget center() => Center(
        child: this,
      );

  Widget expanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );

  Widget annotatedRegion([SystemUiOverlayStyle color = SystemUiOverlayStyle.dark]) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: color,
        child: this,
      );

  Widget darkRegion() => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: this,
      );

  Widget lightRegion() => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: this,
      );
}
