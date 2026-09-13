import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/circle_icon_button.dart';

class ProductDetailsAppBar extends StatelessWidget {
  final String title;
  final String sku;
  final VoidCallback? onMore;

  const ProductDetailsAppBar({
    super.key,
    required this.title,
    required this.sku,
    this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        CircleIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.of(context).maybePop(),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: isDark ? AppStyles.font16BoldDark : AppStyles.font16BoldLight,
              ),
              SizedBox(height: 2.h),
              Text(
                'SKU · $sku',
                style: isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight,
              ),
            ],
          ),
        ),
        CircleIconButton(
          icon: Icons.more_vert_rounded,
          onTap: onMore,
        ),
      ],
    );
  }
}


