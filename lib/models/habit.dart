import 'package:isar/isar.dart';

//run cmd to generate file : dart run build_runner bulid
part 'habit.g.dart';

@Collection()
class Habit {
  //habit id
  Id id = Isar.autoIncrement;

  //habit name
  late String name;

  //completed days
  List<DateTime> completedDays = [
    //DateTime (y, m, d),
    //DateTime (2024, 6, 24),
    //DateTime (2024, 6, 25),
  ];
}