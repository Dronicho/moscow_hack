// import 'package:architecture_setup/data/models/models.dart';
// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// import 'utils.dart';

// class FullScreenVideo extends StatefulWidget {
//   final Attachment attachment;

//   FullScreenVideo({
//     Key key,
//     @required this.attachment,
//   }) : super(key: key);

//   @override
//   _FullScreenVideoState createState() => _FullScreenVideoState();
// }

// class _FullScreenVideoState extends State<FullScreenVideo> {
//   ChewieController _chewieController;
//   VideoPlayerController _videoPlayerController;
//   bool initialized = false;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//       ),
//       body: Builder(
//         key: _scaffoldKey,
//         builder: (context) {
//           if (!initialized) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return Chewie(
//             controller: _chewieController,
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController =
//         VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/image-rescale.appspot.com/o/1%2FDefaultAttachmentTypes.video%2Fdata%2Fuser%2F0%2Fcom.example.architecture_setup%2Fcache%2Ffile_picker%2FScreen_Recording_20201010-151911.mp4?alt=media&token=65023601-4222-46f6-9233-fd6212105f0ef');
//     _videoPlayerController.initialize().whenComplete(() {
//       setState(() {
//         initialized = true;
//         _chewieController = ChewieController(
//           videoPlayerController: _videoPlayerController,
//           autoInitialize: false,
//           aspectRatio: _videoPlayerController.value.aspectRatio,
//         );
//       });
//     });

//     VoidCallback errorListener;
//     errorListener = () {
//       if (_videoPlayerController.value.hasError) {
//         Navigator.pop(context);
//         launchURL(_scaffoldKey.currentContext, widget.attachment.titleLink);
//       }
//       _videoPlayerController.removeListener(errorListener);
//     };
//     _videoPlayerController.addListener(errorListener);
//   }

//   @override
//   void dispose() {
//     _videoPlayerController?.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }
// }