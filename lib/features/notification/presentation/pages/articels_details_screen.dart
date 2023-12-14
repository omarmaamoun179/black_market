import 'package:black_market/features/notification/data/models/articels_details/datum.dart';
import 'package:flutter/material.dart';

class ArticelsDetailsScreen extends StatelessWidget {
  ArticelsDetailsScreen({super.key, this.datumArticlesDetails});
  DatumArticlesDetails? datumArticlesDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(datumArticlesDetails!.title!),
      ),
    );
  }
}
