import 'package:covid19/model/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/dom.dart' as dom;
part 'symptoms.dart';
part 'prevention.dart';
part 'reports.dart';
part 'about.dart';

class ExpandableItems {
  bool isExpanded;
  Image iconpic;
  final String header;
  final Widget body;
  ExpandableItems(this.isExpanded, this.header, this.body, this.iconpic);
}
