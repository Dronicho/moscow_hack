// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:moscow/modules/service/widgets/meeting_card.dart';
// import 'package:moscow/modules/service/widgets/meeting_detail_page.dart';
// import 'package:moscow/styles/colors.dart';
// import 'package:moscow/widgets/widgets.dart';

// class ServiceView extends StatelessWidget {
//   const ServiceView({Key? key, this.onClose}) : super(key: key);

//   final VoidCallback? onClose;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('StartHub'),
//           leading: onClose != null
//               ? BackButton(
//                   onPressed: onClose,
//                 )
//               : null),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                   height: 150,
//                   child: EventCard(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) =>
//                                 MeetingDetailPage(tag: 'tag')));
//                       },
//                       tag: 'tag')),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
