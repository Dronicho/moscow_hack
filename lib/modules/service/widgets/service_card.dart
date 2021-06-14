import 'package:flutter/material.dart';
import 'package:moscow/styles/colors.dart';
import 'package:moscow/widgets/widgets.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {Key? key,
      required this.title,
      required this.shortTile,
      required this.detailPage,
      required this.icon,
      required this.description})
      : super(key: key);

  final String title;
  final String description;
  final IconData icon;
  final Widget shortTile;
  final Widget detailPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: primaryShadow,
          borderRadius: BorderRadius.circular(12)),
      child: Material(
        elevation: 0,
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => detailPage));
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PrimaryIconButton(icon: icon, onPressed: () {}),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500)),
                        Text(
                          description,
                          maxLines: 2,
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                shortTile
              ],
            ),
          ),
        ),
      ),
    );
  }
}
