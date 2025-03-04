import 'package:flutter/material.dart';
import 'package:story_cube_app/constants/text_styles.dart';
import 'package:story_cube_app/ui/pages/pages.dart';

import 'constants/icon_sizes.dart';

class TabSelector extends StatelessWidget {
  TabSelector({super.key});

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  final List<Widget> _pages = [
    const TimelinePage(),
    const ChroniclePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, index, child) {
          return IndexedStack(
            index: index,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, index, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: index,
                onTap: (newIndex) => _currentIndex.value = newIndex,
                iconSize: AppIconSizes.medium,
                unselectedLabelStyle: AppTextStyles.caption,
                selectedLabelStyle: AppTextStyles.caption,
                items: [
                  BottomNavigationBarItem(
                    label: 'Timeline',
                    icon: Icon(_currentIndex.value == 0 ? Icons.date_range : Icons.date_range_outlined),
                  ),
                  BottomNavigationBarItem(
                    label: 'Chronicle',
                    icon: Icon(_currentIndex.value == 1 ? Icons.account_box : Icons.account_box_outlined),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
