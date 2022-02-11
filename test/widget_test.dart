

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import 'base_structure.dart';

void main() {
  testWidgets('expecting default values', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(<BarItem>[
        _barItem,
        _barItem,
      ], false),
    );

    await tester.pumpWidget(
      baseStructure(<BarItem>[
        _barItemWithColor,
        _barItemWithColor,
      ], true),
    );

    expect(
      tester
          .widget<SlidingClippedNavBar>(find.byType(SlidingClippedNavBar))
          .iconSize,
      30.0,
    );

    expect(
      tester
          .widget<SlidingClippedNavBar>(find.byType(SlidingClippedNavBar))
          .backgroundColor,
      Colors.white,
    );
  });

  testWidgets('Ticker has been disposed.', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(<BarItem>[
        _barItem,
        _barItem,
      ], false),
    );

    await tester.pumpWidget(
      baseStructure(<BarItem>[
        _barItemWithColor,
        _barItemWithColor,
      ], true),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets(
      'throws assertion error if items are less than two or greater than four',
      (WidgetTester tester) async {
    // Less than two items, throw exception
    expect(() async {
      await tester.pumpWidget(baseStructure(<BarItem>[
        _barItem,
      ], false));
    }, throwsAssertionError);

    expect(() async {
      await tester.pumpWidget(baseStructure(<BarItem>[
        _barItemWithColor,
      ], true));
    }, throwsAssertionError);

    expect(() async {
      await tester.pumpWidget(baseStructure(<BarItem>[
        _barItem,
        _barItem,
        _barItem,
        _barItem,
        _barItem,
      ], false));
    }, throwsAssertionError);

     expect(() async {
      await tester.pumpWidget(baseStructure(<BarItem>[
        _barItemWithColor,
        _barItemWithColor,
        _barItemWithColor,
        _barItemWithColor,
        _barItemWithColor,
      ], true));
    }, throwsAssertionError);
  });

  testWidgets(
      'Make sure no active and inactive color added to BarItem when used SlidingClippedNavBar',
      (WidgetTester tester) async {
    // Less than two items, throw exception
    expect(() async {
      await tester.pumpWidget(baseStructure(<BarItem>[
        _barItemWithColor,
        _barItemWithColor,
      ], false));
    }, throwsAssertionError);
  });

  testWidgets(
      'Make sure it\'s required to assign active and inactive color added to BarItem when used SlidingClippedNavBar.colorful',
      (WidgetTester tester) async {
    // Less than two items, throw exception
    expect(() async {
      await tester.pumpWidget(baseStructure(<BarItem>[
        _barItem,
        _barItem,
      ], true));
    }, throwsAssertionError);
  });
}

final BarItem _barItem = BarItem(
  title: 'title',
  icon: Icons.home,
);

final BarItem _barItemWithColor = BarItem(
  title: 'title',
  icon: Icons.home,
  activeColor: Colors.red,
  inactiveColor: Colors.green,
);
