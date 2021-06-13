import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {Key? key,
      required this.title,
      required this.shortTile,
      required this.detailPage})
      : super(key: key);

  final String title;
  final Widget shortTile;
  final Widget detailPage;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => detailPage));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  Text(title, style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              shortTile
            ],
          ),
        ),
      ),
    );
  }
}
