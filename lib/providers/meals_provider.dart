import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meals_mock.dart';

final mealsProvider = Provider((ref) {
  return mealList;
});
