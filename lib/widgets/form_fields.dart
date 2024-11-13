import 'package:chain_break/utils/fonts.dart';
import 'package:flutter/material.dart';

class AppFormField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged? onChange;
  final String heading;
  final String? hintText;
  final bool? isObsecure;
  final Widget? icon;
  final Function(bool)? onToggleVisibility;
  const AppFormField(
      {super.key,
      required this.controller,
      this.onChange,
      required this.heading,
      this.hintText,
      this.isObsecure,
      this.icon, 
      this.onToggleVisibility});

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style:Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 5,),
        TextFormField(
          controller: widget.controller,
          obscureText: _isObscure,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: widget.hintText,
            suffixIcon: widget.isObsecure != null
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                    if (widget.onToggleVisibility != null) {
                      widget.onToggleVisibility!(_isObscure);
                    }
                  },
                )
              : null,
          ),
        ),
      ],
    );
  }
}

