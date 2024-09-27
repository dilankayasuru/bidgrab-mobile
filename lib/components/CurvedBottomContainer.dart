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

    // Start the path from the top-left corner and draw a line to near the bottom-left corner.
    path.lineTo(0.0, size.height - 50);

    // Define the control point and end point for the curve.
    var controlPoint = Offset(size.width / 2, size.height + 15); // Create the curve
    var endPoint = Offset(size.width, size.height - 50); // End point at bottom right

    // Draw a quadratic bezier curve from the current point to the end point using the control point.
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    // Draw a line from the end point to the top-right corner.
    path.lineTo(size.width, 0.0);

    // Close the path to form a complete shape.
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
