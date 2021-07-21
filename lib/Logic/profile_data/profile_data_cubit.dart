import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Data/Models/profile_data.dart';
import 'package:dsp_student_application/Data/Repositories/authentication.dart';
import 'package:dsp_student_application/Data/Repositories/profile_data/profile_data.dart';
import 'package:meta/meta.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit()
      : super(ProfileDataState(
            fullName: 'N/A',
            email: 'N/A',
            rating: ' ',
            statusCode: null,
            grade: Grade.Primary));

  void showProfileData() async {
    print(Tokens.signInToken);
    if (ProfileData.fullName == null) {
      await ProfileData.getProfileInfo();
    }
    if (ProfileData.fullName != null)
      emit(ProfileDataState(
          fullName: ProfileData.fullName,
          email: ProfileData.email,
          grade: ProfileData.grade,
          rating: ProfileData.rating));
  }
}
