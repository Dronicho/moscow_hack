import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moscow/domain/models/user.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/widgets.dart';

import 'like_modal.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key? key, required this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text('Список участников', style: TextStyle(fontSize: 24)),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: primaryShadow,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: user.photoUrl != null
                            ? CachedNetworkImageProvider(user.photoUrl!)
                            : null,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(user.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                PrimaryIconButton(
                                    decorate: false,
                                    icon: Icons.sentiment_satisfied_alt_rounded,
                                    onPressed: () async {
                                      final res = await showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) => LikeModal(
                                                onPressed:
                                                    (sat, shool, groups) =>
                                                        null,
                                              ));
                                    }),
                                SizedBox(width: 16),
                                PrimaryIconButton(
                                    decorate: false,
                                    icon: Icons.person_off_outlined,
                                    onPressed: () {}),
                                SizedBox(width: 16),
                                PrimaryIconButton(
                                    icon: Icons.mail, onPressed: () {})
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
