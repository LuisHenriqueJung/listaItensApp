import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget(
      {Key? key, required this.onChanged, required this.hint, this.controller})
      : super(key: key);
  final controller;
  final onChanged;
  final String? hint;
  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.blue.shade300,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(fontSize: 12),
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.grey[150]),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(28.0),
          ),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(28.0)),
          borderSide: BorderSide(color: Colors.blue.shade300, width: 1.0),
        ),
      ),
    );
  }
}
