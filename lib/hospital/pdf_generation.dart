import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';


class PdfGenerator {
  final String name;
  final String age;
  final String number;
  final String address;
  final String description;
  final String hospital;

  PdfGenerator({
    required this.name,
    required this.age,
    required this.number,
    required this.address,
    required this.description,
    required this.hospital,
  });

  Future<String> generateAndSavePdf() async {
    final pdf = pw.Document();
    final logo = pw.MemoryImage(
      (await rootBundle.load('assets/logos/logoArogya.png')).buffer.asUint8List(),
    );

    final font =
        pw.Font.ttf(await rootBundle.load('assets/TiroBangla-Regular.ttf'));

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(4.0),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header Section
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          hospital,
                          style: pw.TextStyle(
                            fontSize: 20,
                            fontWeight: pw.FontWeight.bold,
                            font: font,
                          ),
                        ),
                        pw.SizedBox(height: 15),
                        pw.Text('Date:____________________',
                            style: pw.TextStyle(font: font)),
                      ],
                    ),
                    pw.Container(
                      height: 50,
                      width: 150,
                      child: pw.Image(logo),
                    ),
                  ],
                ),
                pw.Divider(),

                // Patient Details
                pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    'Patient Details:',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      font: font,
                    ),
                  ),
                ),

                pw.SizedBox(height: 5),
                pw.Text('Name: $name', style: pw.TextStyle(font: font)),
                pw.SizedBox(height: 5),
                pw.Text('Age: $age', style: pw.TextStyle(font: font)),
                pw.SizedBox(height: 5),
                pw.Text('Phone Number: $number',
                    style: pw.TextStyle(font: font)),
                pw.SizedBox(height: 5),
                pw.Text('Address: $address', style: pw.TextStyle(font: font)),

                pw.SizedBox(height: 8),
                // Health Description
                pw.Text(
                  'Health Description: $description',
                  style:
                      pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font),
                ),

                pw.SizedBox(height: 6),

                // Footer Section
                pw.Divider(),
                pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    'Prescription',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      font: font,
                    ),
                  ),
                ),
                pw.SizedBox(height: 400),
                pw.Divider(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Doctor Details: ',
                            style: pw.TextStyle(font: font)),
                        pw.SizedBox(height: 24),
                        pw.Text('Signature:____________________',
                            style: pw.TextStyle(font: font)),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Date:____________________',
                            style: pw.TextStyle(font: font)),
                        pw.SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    // Get the application's document directory
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/appointment_prescription.pdf';

    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    return filePath; // Return the path of the saved PDF
  }
}
