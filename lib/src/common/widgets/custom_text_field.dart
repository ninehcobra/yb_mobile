import '../../../common_libs.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final bool isError;
  final String errorValue;
  final bool isCorrect;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.isError = false,
    this.errorValue = '',
    this.isCorrect = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.errorColor500
                    : (widget.isCorrect
                        ? AppColors.successColor500
                        : AppColors.neutralColor500),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.errorColor500
                    : (widget.isCorrect
                        ? AppColors.successColor500
                        : AppColors.neutralColor500),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.isError
                    ? AppColors.errorColor500
                    : (widget.isCorrect
                        ? AppColors.successColor500
                        : AppColors.neutralColor500),
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.errorColor500),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppColors.errorColor500, width: 2.0),
            ),
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.neutralColor300),
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: widget.isError
                  ? AppColors.errorColor500
                  : widget.isCorrect
                      ? AppColors.successColor500
                      : AppColors.neutralColor500,
            ),
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: widget.isPassword
                ? Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        if (widget.isError)
                          Icon(Icons.error_outline,
                              color: AppColors.errorColor500, size: 20)
                        else if (widget.isCorrect)
                          Icon(Icons.check_circle,
                              color: AppColors.successColor600, size: 20),
                      ],
                    ),
                  )
                : (widget.isError
                    ? Icon(Icons.error_outline, color: AppColors.errorColor500)
                    : (widget.isCorrect
                        ? Icon(Icons.check_circle,
                            color: AppColors.successColor600)
                        : null)),
            errorText: widget.isError ? widget.errorValue : null,
            errorStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.errorColor500, fontSize: 10)),
      ),
    );
  }
}
