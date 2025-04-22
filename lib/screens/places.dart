import 'package:favourite_places/provider/user_places.dart';
import 'package:favourite_places/screens/add_places.dart';
import 'package:favourite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  void _addPlaces(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const AddPlacesScreen()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              _addPlaces(context);
            },
            icon: Icon(Icons.arrow_outward_rounded),
            iconSize: 35,
          ),
        ],
      ),
      body: PlacesList(places: userPlaces),
    );
  }
}
