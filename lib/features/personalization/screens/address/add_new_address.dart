import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Új cím hozzáadása'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Form(
              child: Column(
                children: [
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Név')),
                  const SizedBox(height: TSize.spaceBetweenInputFields),
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.phone), labelText: 'Telefonszám')),
                  const SizedBox(height: TSize.spaceBetweenInputFields),
                  Row(
                    children: [
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.buildings_2), labelText: 'Település'))),
                      const SizedBox(width: TSize.spaceBetweenInputFields),
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Irányítószám'))),
                    ],
                  ),
                  const SizedBox(height: TSize.spaceBetweenInputFields),
                  Row(
                    children: [
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'Utca'))),
                      const SizedBox(width: TSize.spaceBetweenInputFields),
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.house_2), labelText: 'Házszám'))),
                    ],
                  ),
                  const SizedBox(height: TSize.defaultSpace),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Mentés'))),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
