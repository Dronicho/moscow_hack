// import 'package:flutter/material.dart';

// import 'image_item.dart';

// // TODO: FIX THIS

// class ImageModal extends StatefulWidget {
//   final ScrollController controller;
//   ImageModal({
//     Key key,
//     this.controller,
//   }) : super(key: key);

//   @override
//   _ImageModalState createState() => _ImageModalState();
// }

// class _ImageModalState extends State<ImageModal>
//     with AutomaticKeepAliveClientMixin {

//   final List<dynamic> _selected = [];

//   bool isSelected(dynamic image) {
//     return _selected.contains(image);
//   }

//   Widget _buildItem(dynamic image) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return Stack(
//         children: [
//           ImageItem(image: image, height: 150, width: constraints.maxWidth),
//           Positioned(
//             right: 8,
//             top: 8,
//             width: 16,
//             height: 16,
//             child: Checkbox(
//               value: isSelected(image),
//               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               onChanged: (val) {
//                 setState(() {
//                   if (val) {
//                     _selected.add(image);
//                   } else {
//                     _selected.remove(image);
//                   }
//                 });
//               },
//             ),
//           )
//         ],
//       );
//     });
//   }

//   Widget _buildRow(List<dynamic> images) {
//     return LayoutBuilder(builder: (context, BoxConstraints constraints) {
//       final maxWidth = constraints.maxWidth;

//       return Row(
//           children: images
//               .map((e) => Container(
//                     width: maxWidth / images.length,
//                     child: Container(
//                       color: Colors.white,
//                       child: Padding(
//                         padding: EdgeInsets.all(2),
//                         child: _buildItem(e),
//                       ),
//                     ),
//                   ))
//               .toList());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Obx(() => _controller.imageProviderReady.value
//         ? SafeArea(
//             child: CustomScrollView(
//               controller: widget.controller,
//               slivers: [
//                 SliverAppBar(
//                   flexibleSpace: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       if (_selected != null)
//                         IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () {
//                             Get.back(result: _selected);
//                           },
//                         )
//                     ],
//                   ),
//                   pinned: true,
//                 ),
//                 // SliverList(
//                 //     delegate: SliverChildBuilderDelegate(
//                 //   (context, index) {
//                 //     return _buildRow(_controller.imageBatch(index));
//                 //   },
//                 //   childCount: _controller.imageRows,
//                 // )),
//               ],
//             ),
//           )
//         : Center(child: CircularProgressIndicator()));
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
