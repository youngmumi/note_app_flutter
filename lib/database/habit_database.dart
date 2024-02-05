import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testingappcoding/models/app_settings.dart';
import 'package:testingappcoding/models/habit.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  /*
  set up
   */


  // initialize - database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar =
        await Isar.open(
            [HabitSchema, AppSettingsSchema],
            directory: dir.path,
        );
  }

  //save first data of app startup (for heatmap)
  Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettings()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  //Get first date of app startup (for heatmap)
  Future<DataTime?> getFirstLaunchData() async{
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }


  /*
  crud x operations
   */

  //List of habits
  final List<Habit> currentHabits = [];

  //create -add a new habit
  Future<void> addHabit(String habitName) async {
    // create a new habit
    final newHabit = Habit()..name = habitName;

    // save to db
    await isar.writeTxn(() => isar.habits.put(newHabit));

    // re-read from db
    readHabits();
  }

  //read - read saved habits from db
  Future<void> readHabits() async {
    // fetch all habit from db
    List<Habit> fetchedHabits = await isar.habits.where().findAll();

    // give to current habit
    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);

    //update UI
    notifyListeners();
  }

  //update - check habit on and off
  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    //find the specific habit
    final habit = await isar.habits.get(id);
    
    //update completion status
    if (habit != null){
      await isar.writeTxn(() async {
        //if habit is completed -> add the current date to the completedays list
        if (isCompleted && !habit.completedDays.contains(DateTime.now())) {
          //today
          final today = DateTime.now();

          //add the current date if it's not already in the list
          habit.completedDays.add(
            DateTime(
              today.year,
              today.month,
              today.day,
            ),
          );
        }

        //if habit is NOT completed -> remove the current data from the list
        else {
          //remove the current date if the habit is marked as not completed
            habit.completedDays.removeWhere((data) =>
                date.year == DateTime.now().year &&
                data.month == DateTime.now().month &&
                data.day == DateTime.now().day
            );
          }
          //save the updated habits back to the db
          await isar.habits.put(habit);
        }
      );
    }
    //re-read from db
    readHabits();
  }

  //update - edit habit name
  Future<void> updateHabitName( int id, String newName) async {
    // find the specific habit
    final habit = await isar.habits.get(id);

    //update habit name
    if (habit != null) {
      await isar.writeTxn(() async{
        habit.name = newName;

        //save up
      })
    }
  }

  //delete - delete habit

}