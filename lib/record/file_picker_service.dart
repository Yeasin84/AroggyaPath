import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<String?> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png', 'jpeg'],
      );

      if (result != null && result.files.single.path != null) {
        return result.files.single.path!;
      }
    } catch (e) {
      print("File picking error: $e");
    }
    return null;
  }
}
