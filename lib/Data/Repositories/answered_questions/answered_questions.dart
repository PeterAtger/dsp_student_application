import 'package:dsp_student_application/Data/Repositories/profile_data/profile_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnsweredQuestionsData {
  const AnsweredQuestionsData();

  static List<String> listOfAnswers = [];

  static Future<List<String>> getAnswers() async {
    if (listOfAnswers.isEmpty) await loadFromPhone();
    return listOfAnswers;
  }

  static void addAnswer(String answer) {
    print(listOfAnswers);
    if (!listOfAnswers.contains(answer)) {
      listOfAnswers.add(answer);
    }
    _saveToPhone();
  }

  static Future<void> _saveToPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("listOfAnswers ${ProfileData.id}", listOfAnswers);
  }

  static Future<void> loadFromPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> loadedList =
        prefs.getStringList('listOfAnswers ${ProfileData.id}');
    if (loadedList != null) listOfAnswers = loadedList;
  }
}
