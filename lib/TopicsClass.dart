import 'package:flutter/cupertino.dart';

class Topic {
  String _imagePath;
  String _name;
  bool isSelected=false;
  String get topicImagePath => _imagePath;
  String get topicName => _name;
  Topic({@required String imagePath,@required String name}):_imagePath = imagePath,_name=name;
}