import 'package:flutter/material.dart';

double convertPx2Dpx(context, double px) {
  return MediaQuery.of(context).devicePixelRatio * px;
}
