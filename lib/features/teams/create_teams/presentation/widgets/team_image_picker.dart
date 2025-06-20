// import 'package:flutter/material.dart';

// class TeamImagePicker extends StatelessWidget {
//   final String? imagePath;
//   final VoidCallback onImagePick;

//   const TeamImagePicker({
//     super.key,
//     this.imagePath,
//     required this.onImagePick,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onImagePick,
//       child: Container(
//         width: 120,
//         height: 120,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.grey[200],
//           border: Border.all(color: Colors.grey[300]!, width: 2),
//         ),
//         child: imagePath != null
//             ? ClipOval(
//                 child: Image.asset(
//                   imagePath!,
//                   fit: BoxFit.cover,
//                 ),
//               )
//             : Icon(
//                 Icons.camera_alt,
//                 size: 40,
//                 color: Colors.grey[600],
//               ),
//       ),
//     );
//   }
// }
