import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';


class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  Future<Map<String, Map<String, int>>> _fetchFishingSpots() async {
    try {
      final db = FirebaseFirestore.instance;

      // Fetch all fishing spots and counties
      final spotsSnapshot = await db.collection('FishingSpots').get();
      final countiesSnapshot = await db.collection('Counties').get();

      // Map county IDs to names
      final countiesMap = {
        for (var doc in countiesSnapshot.docs) doc.id: doc.data()['name'] as String
      };

      final Map<String, Map<String, int>> result = {};

      for (var doc in spotsSnapshot.docs) {
        final spot = doc.data();
        final countyId = spot['countyId'] as String;
        final waterType = spot['waterType'] as String;
        final countyName = countiesMap[countyId] ?? 'Ismeretlen Megye';

        if (!result.containsKey(countyName)) {
          result[countyName] = {};
        }

        final waterTypeCount = result[countyName]!.putIfAbsent(waterType, () => 0);
        result[countyName]![waterType] = waterTypeCount + 1;
      }

      return result;
    } catch (e) {
      // Log or handle the error appropriately
      throw Exception('Failed to fetch fishing spots: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Tesztelés')),

      body: FutureBuilder<Map<String, Map<String, int>>>(
        future: _fetchFishingSpots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Hiba történt: ${snapshot.error}'));
          }

          final data = snapshot.data ?? {};

          if (data.isEmpty) {
            return const Center(child: Text('Nincs elérhető adat.'));
          }

          return ListView(
            children: data.entries.map((countyEntry) {
              final countyName = countyEntry.key;
              final waterTypes = countyEntry.value;

              return ExpansionTile(
                title: Text('Megye: $countyName'),
                children: waterTypes.entries.map((waterTypeEntry) {
                  final waterType = waterTypeEntry.key;
                  final count = waterTypeEntry.value;

                  return ListTile(
                    title: Text('Víz típus: $waterType'),
                    trailing: Text(count.toString()),
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}




