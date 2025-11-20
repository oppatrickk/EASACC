import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/core/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.widget,
  });

  final String title;
  final CustomIconData icon;
  final Function()? onTap;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.surfaceContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomIcon(
                  icon: icon,
                  size: 24,
                  color: context.colorScheme.text,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.text),
            ),
            Spacer(),
            widget ?? const SizedBox.shrink(),
            CustomIcon(
              icon: CustomIconData.chevronRight,
              size: 24,
              color: context.colorScheme.text,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
