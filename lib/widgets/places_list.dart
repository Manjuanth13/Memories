import 'package:flutter/material.dart';
import 'package:memories/models/place.dart';
import 'package:memories/screens/place_detail.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({required this.places, super.key});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No items Added item',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        subtitle: Text(
          places[index].location.address,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlaceDetailScreen(
                place: places[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
