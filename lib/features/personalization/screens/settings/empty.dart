import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../browsing/controllers/fishingspot_controller.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the FishingSpotController
    final FishingSpotController controller = Get.put(FishingSpotController());

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: const Text('Tesztelés')),
      body: Obx(() {
        // Check if the counties list is empty
        if (controller.counties.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Display the list of counties
        return ListView.builder(
          itemCount: controller.counties.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.counties[index]),
            );
          },
        );
      }),
    );
  }
}

