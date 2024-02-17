import 'package:flutter/material.dart';

import '../../../shared/utils/colors_pallete.dart';
import '../../../shared/utils/sizes.dart';
import '../../../shared/widgets/text_view_widget.dart';
import '../../domain/domain.dart';

class DropdownWidget extends StatelessWidget {
  final String? title;
  final List<AssetEntity> listAsset;
  final Function(String?) onChanged;

  const DropdownWidget({
    super.key,
    required this.listAsset,
    required this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Sizes.x3),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsPallete.primaryColor,
        borderRadius: BorderRadius.circular(Sizes.x1),
      ),
      child: DropdownButton(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.all(Sizes.x1),
          child: TextViewWidget(
            label: title ?? 'Select asset',
            size: Sizes.x2,
            color: ColorsPallete.backgroundColor,
          ),
        ),
        items: listAsset.map((asset) {
          return DropdownMenuItem(
            value: asset.symbol,
            child: TextViewWidget(
              label: asset.symbol,
              size: Sizes.x2,
              color: ColorsPallete.primaryColor,
            ),
          );
        }).toList(),
        onChanged: onChanged,
        iconEnabledColor: ColorsPallete.greyColor,
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: Sizes.x3,
        underline: const SizedBox.shrink(),
      ),
    );
  }
}
