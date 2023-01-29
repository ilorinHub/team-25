// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:machineglow/screens/dashboard/ui/camera.dart';
// import 'dart:ui' show lerpDouble;

// class ControlsLayer extends StatelessWidget {
//   final double offset;
//   final Function()? onTap;
//   final ShadowTween shadowTween;
//   final TakePictureTween buttonTween;
//   final CameraIcon cameraIcon;
//   final void Function()? onCameraTap;

//   ControlsLayer(
//       {super.key,
//       required this.offset,
//       required this.onTap,
//       required this.cameraIcon,
//       required this.onCameraTap})
//       : buttonTween = TakePictureTween(
//             _TakePicture(
//               70.0,
//               100.0,
//               onTap: onTap,
//             ),
//               _TakePicture(
//               50.0,
//               80.0,onTap: onTap,
//             )),
//         shadowTween = ShadowTween(const _Shadow(-290.0), const _Shadow(-150.0));

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         shadowTween.lerp(offset),
//         buttonTween.lerp(offset),
//         _Controls(cameraIcon, onCameraTap)
//       ],
//     );
//   }
// }

// class _Controls extends StatelessWidget {
//   final CameraIcon cameraIcon;
//   final void Function()? onCameraTap;

//   const _Controls(this.cameraIcon, this.onCameraTap);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 35.0,
//       left: 20.0,
//       child: SizedBox(
//         width: 20.0,
//         height: 40.0,
//         child: GestureDetector(
//           onTap: onCameraTap,
//           child: cameraIcon,
//         ),
//       ),
//     );
//   }
// }

// class _TakePicture extends StatelessWidget {
//   final double bottom;
//   final double diameter;
//   final Function()? onTap;

//   const _TakePicture(this.bottom, this.diameter, {required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         bottom: bottom,
//         left: MediaQuery.of(context).size.width / 2 - 50,
//         child: SizedBox(
//             width: 100.0,
//             height: 100.0,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               child: SizedBox(
//                 width: diameter,
//                 height: diameter,
//                 child: GestureDetector(
//                   onTap: onTap,
//                   child: Container(
//                     decoration: const ShapeDecoration(
//                         shape: CircleBorder(
//                             side: BorderSide(width: 5.0, color: Colors.white))),
//                   ),
//                 ),
//               ),
//             )));
//   }

//   static _TakePicture lerp(_TakePicture begin, _TakePicture end, double t) {
//     return _TakePicture(lerpDouble(begin.bottom, end.bottom, t)!,
//         lerpDouble(begin.diameter, end.diameter, t)!,
//         onTap: begin.onTap);
//   }
// }

// class TakePictureTween extends Tween<_TakePicture> {
//   TakePictureTween(_TakePicture begin, _TakePicture end)
//       : super(begin: begin, end: end);

//   @override
//   _TakePicture lerp(double t) => _TakePicture.lerp(begin!, end!, t);
// }

// class _Shadow extends StatelessWidget {
//   final double bottom;

//   const _Shadow(this.bottom);

//   final double shadowSize = 250.0;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom: bottom,
//       left: MediaQuery.of(context).size.width / 2 - (shadowSize / 2),
//       child: Transform.rotate(
//         angle: pi / 4,
//         child: Container(
//           width: shadowSize,
//           height: shadowSize,
//           decoration: const BoxDecoration(boxShadow: <BoxShadow>[
//             BoxShadow(color: Colors.black12, blurRadius: 20.0)
//           ], borderRadius: BorderRadius.all(Radius.circular(40.0))),
//         ),
//       ),
//     );
//   }

//   static _Shadow lerp(_Shadow begin, _Shadow end, double t) {
//     return _Shadow(lerpDouble(begin.bottom, end.bottom, t)!);
//   }
// }

// class ShadowTween extends Tween<_Shadow> {
//   ShadowTween(_Shadow begin, _Shadow end) : super(begin: begin, end: end);

//   @override
//   _Shadow lerp(double t) => _Shadow.lerp(begin!, end!, t);
// }
