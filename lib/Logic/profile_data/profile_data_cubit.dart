import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Data/Models/profile_data.dart';
import 'package:dsp_student_application/Data/Repositories/profile_data/profile_data.dart';
import 'package:meta/meta.dart';

part 'profile_data_state.dart';

// NOT IMPORTANTTTT YOU CAN REMOVE THIS CLASS LATER

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit()
      : super(ProfileDataState(
            fullName: 'N/A',
            email: 'N/A',
            rating: ' ',
            statusCode: null,
            grade: null));

  void showProfileData() async {
    print(ProfileData.grade);
    if (ProfileData.fullName == null) {
      await ProfileData.getProfileInfo();
    }
    if (ProfileData.fullName != null)
      emit(ProfileDataState(
        fullName: ProfileData.fullName,
        email: ProfileData.email,
        grade: ProfileData.grade,
      ));
  }
}
