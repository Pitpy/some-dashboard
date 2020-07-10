import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final List<Map<String, Object>> _title;

  DetailPage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F3F55),
        title: Text(_title[0]["main"].toString()),
      ),
    );
  }
}
