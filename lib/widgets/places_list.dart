import 'package:favourite_places/model/place.dart';
import 'package:favourite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No Items Added Yet.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder:
          (ctx, index) => ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlaceDetailScreen(place: places[index]),
                ),
              );
            },
          ),
    );
  }
}
