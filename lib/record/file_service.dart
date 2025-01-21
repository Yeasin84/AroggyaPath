import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'document_model.dart';

class FileService {
  Future<String> saveFileLocally(String sourcePath, String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final newPath = '${directory.path}/$fileName';
      final file = File(sourcePath);
      await file.copy(newPath); // Copy file to app storage
      return newPath;
    } catch (e) {
      print("Error saving file locally: $e");
      rethrow;
    }
  }

  Future<List<Document>> fetchDocuments() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final files = directory.listSync();

      return files
          .whereType<File>()
          .map((file) => Document(
                name: file.uri.pathSegments.last,
                date: DateTime.now()
                    .toString(), // You can store metadata elsewhere
                filePath: file.path,
              ))
          .toList();
    } catch (e) {
      print("Error fetching files: $e");
      return [];
    }
  }

  Future<bool> deleteDocument(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      print("Error deleting file: $e");
      return false;
    }
  }
}
