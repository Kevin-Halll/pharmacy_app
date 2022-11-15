import 'package:flutter/material.dart';

class MainButtons extends StatefulWidget {
  final void Function()? onclickFunction;
  final dynamic text;
  final bool isLoading;

  const MainButtons({
    super.key,
    this.onclickFunction,
    required this.text,
    required this.isLoading,
  });

  @override
  State<MainButtons> createState() => _MainButtonsState();
}

class _MainButtonsState extends State<MainButtons> {
  @override
  Widget build(BuildContext context) {
    Color disabledColor =
        const Color.fromRGBO(27, 117, 188, 10).withOpacity(.5);

    return GestureDetector(
      onTap: widget.isLoading ? () {} : widget.onclickFunction,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isLoading
              ? disabledColor
              : const Color.fromRGBO(27, 117, 188, 10),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: widget.text is String?
              ? widget.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      widget.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
              : widget.text,
        ),
      ),
    );
  }
}
