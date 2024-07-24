import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';

class TCircularLoader extends StatelessWidget {
  const TCircularLoader({
    super.key,
    this.size = 50.0, // Giá trị mặc định cho kích thước
    this.color = TColors.primary, // Màu mặc định
    this.strokeWidth = 4.0,
  });

  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
