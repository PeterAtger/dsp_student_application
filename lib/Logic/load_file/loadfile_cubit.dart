import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
part 'loadfile_state.dart';

class LoadfileCubit extends Cubit<LoadfileState> {
  LoadfileCubit() : super(LoadfileState(file: null, fileContent: ""));
  File file;
  String fileContent;

  Future getFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['doc', 'odt', 'pdf', 'rtf', 'tex', 'txt', 'wpd'],
    );

    if (result != null) {
      file = File(result.files.single.path);
      fileContent = file.readAsString() as String;
      //Sending the file to backend//
    } else {
      print("No file selected");
    }
  }

  Future<void> onButtonClick() async {
    await getFile();
    emit(LoadfileState(file: file, fileContent: fileContent));
  }
}
