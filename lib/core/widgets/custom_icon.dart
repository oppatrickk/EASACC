import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatefulWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.height,
  });

  final CustomIconData icon;
  final double? size;
  final double? height;
  final Color? color;

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.icon.assetLocation,
      width: widget.size,
      height: widget.height,
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(widget.color ?? context.colorScheme.text, BlendMode.srcIn),
    );
  }
}
