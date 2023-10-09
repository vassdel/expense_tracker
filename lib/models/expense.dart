import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.breakfast_dining,
  Category.travel: Icons.airplanemode_on_rounded,
  Category.leisure: Icons.sports_basketball,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.ammount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double ammount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}
