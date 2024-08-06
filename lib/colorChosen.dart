import 'package:flutter/material.dart';

class ColorSelectionWidget extends StatefulWidget {
  final Color selectedColor;
  final void Function(Color) onColorSelected;

  ColorSelectionWidget({
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  _ColorSelectionWidgetState createState() => _ColorSelectionWidgetState();
}

class _ColorSelectionWidgetState extends State<ColorSelectionWidget> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _setSelectedColor(Colors.brown),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.brown,
            child: _selectedColor == Colors.brown
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _setSelectedColor(Colors.grey),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey,
            child: _selectedColor == Colors.grey
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _setSelectedColor(Colors.black),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.black,
            child: _selectedColor == Colors.black
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _setSelectedColor(Colors.white70),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white70,
            child: _selectedColor == Colors.white70
                ? const Icon(Icons.check, size: 16, color: Colors.black)
                : null,
          ),
        ),
      ],
    );
  }

  void _setSelectedColor(Color color) {
    setState(() {
      _selectedColor = color;
      widget.onColorSelected(color);
    });
  }
}
