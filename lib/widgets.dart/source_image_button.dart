import 'package:technical_test/common_libs.dart';

class SourceImageButton extends StatelessWidget {
  final IconData prefixIcon;
  final String title;
  final bool isEnabled;
  final double? height;
  final VoidCallback onPressed;

  const SourceImageButton({
    super.key,
    required this.prefixIcon,
    required this.title,
    this.height,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialButton(
        minWidth: const Size.fromHeight(50).width,
        height: height ?? 40.h,
        color: ColorName.white,
        disabledColor: ColorName.disabledColor,
        onPressed: isEnabled ? onPressed : null,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorName.disabledColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(48.0.r),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                prefixIcon,
                size: 24.r,
                color: ColorName.primaryColor,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                title,
                style: theme.textTheme.labelMedium?.copyWith(
                    color: ColorName.primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ));
  }
}
