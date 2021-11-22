import 'dart:math';

import 'package:flutter/material.dart';

class PaginationIndicator extends StatefulWidget {
  const PaginationIndicator({
    Key? key,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.visiblePageCount = 5,
    required this.onPageChanged,
  }) : super(key: key);
  final Color selectedColor;
  final Color unselectedColor;
  final int visiblePageCount;
  final ValueChanged<int> onPageChanged;

  @override
  _PaginationIndicatorState createState() => _PaginationIndicatorState();
}

class _PaginationIndicatorState extends State<PaginationIndicator> {
  int pageCount = 20;
  int selectedPage = 1;
  late List<bool> _selectedPageList;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _selectedPageList = List.generate(
      pageCount,
      (index) => selectedPage == (index + 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // pages
        const SizedBox(width: 8),
        SizedBox(
          width: (48 * widget.visiblePageCount) + widget.visiblePageCount + 1,
          height: 48,
          child: ListView(
            controller: _controller,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              ToggleButtons(
                constraints: const BoxConstraints.expand(height: 48, width: 48),
                children: List.generate(pageCount, (index) => Text("${index + 1}")),
                isSelected: _selectedPageList,
                color: widget.unselectedColor,
                selectedColor: widget.selectedColor,
                onPressed: (index) {
                  _onPressed(index);
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  void _onPressed(int index) {
    selectedPage = index + 1;
    setState(() {
      _selectedPageList = List.generate(
        pageCount,
        (index) => selectedPage == (index + 1),
      );
    });
    _controller.animateTo((48 * max(0, index - 2)) + max(0, index - 2),
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    widget.onPageChanged(selectedPage);
  }
}
