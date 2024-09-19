import 'package:flutter/material.dart';

class CurvedBottomContainer extends StatelessWidget {
  const CurvedBottomContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: child,
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from the top-left corner
    path.lineTo(0.0, size.height - 50); // Move near the bottom left

    // Define one large curve for the bottom
    var controlPoint = Offset(size.width / 2, size.height + 15); // Control point to create the curve
    var endPoint = Offset(size.width, size.height - 50); // End point at bottom right
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    // Move to the top-right corner
    path.lineTo(size.width, 0.0);

    path.close(); // Complete the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
