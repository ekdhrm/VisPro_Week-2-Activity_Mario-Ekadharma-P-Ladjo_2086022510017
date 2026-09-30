import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'menu_item_card.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.items,
    required this.quantities,
    required this.controller,
    required this.onDecrease,
    required this.onIncrease,
  });

  final List<MenuItem> items;
  final Map<String, int> quantities;
  final ScrollController controller;
  final ValueChanged<String> onDecrease;
  final ValueChanged<String> onIncrease;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final MenuItem item = items[index];
        final int quantity = quantities[item.id] ?? 0;

        return MenuItemCard(
          item: item,
          quantity: quantity,
          onDecrease: () => onDecrease(item.id),
          onIncrease: () => onIncrease(item.id),
        );
      },
    );
  }
}
