import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/tmdb_api_url.dart';

import 'package:netflix_ui/data/screen_home/card_scroll_view_model.dart';

//:::::::::::::::;
Rx<CardScrollViewModel?> tenseDramasModel = Rxn<CardScrollViewModel?>();
//::::::::
void getTenseDramasData() async {
  try {
    var response = await http.get(Uri.parse(TmdbApiUrl.topRatedMoviesUrls));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      tenseDramasModel.value = CardScrollViewModel.fromJson(json);
    }
  } catch (e) {
    log("getTenseDramas: Failed to load Data!");
  }
}
