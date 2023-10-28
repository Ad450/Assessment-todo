import "package:flutter/material.dart";

class TodoTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? showLeadingIcon;
  final double? width;
  final Icon? icon;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final double? height;
  final double? borderRadius;
  final List<Color>? gradientColors;
  final List<double>? colorStops;
  final Color? hintTextColor;
  final int? minLines;
  final int? maxLines;
  final bool? expands;
  const TodoTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.validator,
    this.showLeadingIcon,
    this.width,
    this.icon,
    this.onEditingComplete,
    this.focusNode,
    this.height,
    this.borderRadius,
    this.gradientColors,
    this.colorStops,
    this.hintTextColor,
    this.maxLines,
    this.minLines,
    this.expands,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height ?? 60,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands ?? false,
        decoration: InputDecoration(
          fillColor: theme.colorScheme.onSurface,
          filled: true,
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          hintStyle: TextStyle(
            color: hintTextColor ?? Colors.white,
          ),
          prefixIcon: showLeadingIcon != null ? (showLeadingIcon! ? icon : null) : null,
        ),
      ),
    );
  }
}
