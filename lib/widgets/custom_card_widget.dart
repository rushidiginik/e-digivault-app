import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget? child;

  // Browse User specific (optional)
  final String? title;
  final String? count;
  final String? newCount;
  final Color? newColor;
  final VoidCallback? onTap;

  const CustomCardWidget({
    super.key,
    this.child,
    this.title,
    this.count,
    this.newCount,
    this.newColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    final cardContent = Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: w * 0.03),
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      //  agar title diya hai to Browse User UI, warna normal child
      child: title != null
          ? SizedBox(
              height: 46,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title ",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF001678),
                          ),
                        ),
                        TextSpan(
                          text: count ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    newCount ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: newColor ?? Color(0xFF2DC24E),
                    ),
                  ),
                ],
              ),
            )
          : child!,
    );

    //  Click support
    if (onTap != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,

        splashColor: Colors.transparent,
        // ripple remove
        highlightColor: Colors.transparent,
        //  press highlight remove
        hoverColor: Colors.transparent,
        // web hover remove
        focusColor: Colors.transparent,

        // focus remove
        child: cardContent,
      );
    }

    return cardContent;
  }
}
