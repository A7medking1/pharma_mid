import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropMenuDownWidget extends StatelessWidget {
  final String? value;
  final void Function(String?)? onChanged;

  final List<DropdownMenuItem<String>>? items;

  const CustomDropMenuDownWidget({
    super.key,
    this.value,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.white2, borderRadius: BorderRadius.circular(10)),
      // dropdown below..
      child: DropdownButton<String>(
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        items: items,
        // add extra sugar..
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 42,
        underline: const SizedBox(),
      ),
    );
  }
}
