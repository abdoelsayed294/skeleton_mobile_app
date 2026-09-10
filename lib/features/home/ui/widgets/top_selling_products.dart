import 'package:flutter/material.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/product_row.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_header.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TopSellingProducts extends StatelessWidget {
  const TopSellingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final products = [
      (
        l10n.pitaBreadBundle,
        '305 ${l10n.unitsSold}',
        '1,525',
        Icons.lunch_dining_outlined,
        const Color(0xFFF97316),
      ),
      (
        l10n.sunflowerCookingOil,
        '97 ${l10n.unitsSold}',
        '1,940',
        Icons.water_drop_outlined,
        const Color(0xFF2196F3),
      ),
      (
        l10n.egyptianWhiteRice,
        '63 ${l10n.unitsSold}',
        '1,890',
        Icons.grass_outlined,
        const Color(0xFF38BDF8),
      ),
    ];

    return SectionCard(
      child: Column(
        children: [
          SectionHeader(
            title: l10n.topSellingProducts,
            action: l10n.viewAll,
            isDark: isDark,
          ),
          ...List.generate(products.length, (index) {
            final product = products[index];
            return ProductRow(
              rank: index + 3,
              title: product.$1,
              subtitle: product.$2,
              price: product.$3,
              icon: product.$4,
              accentColor: product.$5,
              isDark: isDark,
              isLast: index == products.length - 1,
            );
          }),
        ],
      ),
    );
  }
}
