import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pokemood/models/region.dart';

class RegionRepository {
  Future<List<Region>> loadRegions() async {
    String jsonString = await rootBundle.loadString('assets/regions.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((region) => Region.fromJson(region)).toList();
  }
}
