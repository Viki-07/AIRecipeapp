import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/dummy_data.dart';

final mealProvider = Provider((refe) {
  return DUMMY_MEALS;
});
