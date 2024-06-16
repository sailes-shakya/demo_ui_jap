import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          filled: true,
          fillColor: Color(0xFFF7F7F7),
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
