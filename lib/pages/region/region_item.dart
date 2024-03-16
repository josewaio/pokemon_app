import 'package:flutter/material.dart';
import 'package:pokemood/constants/colors.dart';
import 'package:pokemood/models/region.dart';

class RegionItem extends StatelessWidget {
  final Region region;

  const RegionItem({Key? key, required this.region}) : super(key: key);

  final double itemWidth = 200;
  final double itemHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: CustomColors.getLightYellow,
      child: Container(
        constraints: BoxConstraints(minHeight: itemHeight),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(
                  //bottom: 10,
                  ),
              title: Text(
                region.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.getPokemonBlue),
              ),
              subtitle: Text(
                region.name,
                style: const TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.black),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/maps/${region.image}.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
