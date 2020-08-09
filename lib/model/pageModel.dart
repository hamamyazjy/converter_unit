import 'package:flutter/material.dart';

class PageModel {
  String _title;
  String _description;
  IconData _icon;
  String _image;

  PageModel(this._title, this._description, this._icon, this._image);

  String get title => this._title;
  String get description => this._description;
  IconData get icon => this._icon;
  String get image => this._image;
  
}
