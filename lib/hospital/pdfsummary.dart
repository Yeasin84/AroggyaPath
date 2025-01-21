import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'pdf_generation.dart';
import 'package:permission_handler/permission_handler.dart';

class AppointmentPdfPage extends StatefulWidget {
  final String name;
  final String age;
  final String number;
  final String address;
  final String description;
  final String hospital;

  const AppointmentPdfPage({
    super.key,
    required this.name,
    required this.age,
    required this.number,
    required this.address,
    required this.description,
    required this.hospital,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentPdfPageState createState() => _AppointmentPdfPageState();
}

class _AppointmentPdfPageState extends State<AppointmentPdfPage> {
  bool _isLoading = false;
  String? _pdfFilePath;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetail('Name:', widget.name),
            _buildDetail('Age:', widget.age),
            _buildDetail('Phone Number:', widget.number),
            _buildDetail('Address:', widget.address),
            _buildDetail('Health Description:', widget.description),
            _buildDetail('Selected Hospital:', widget.hospital),
            const SizedBox(height: 20),
            _isLoading
                ? const LinearProgressIndicator()
                : Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });

                        final pdfGenerator = PdfGenerator(
                          name: widget.name,
                          age: widget.age,
                          number: widget.number,
                          address: widget.address,
                          description: widget.description,
                          hospital: widget.hospital,
                        );

                        // Generate and save PDF
                        final pdfFilePath = await pdfGenerator.generateAndSavePdf();

                        setState(() {
                          _isLoading = false;
                          _pdfFilePath = pdfFilePath; // Store the generated PDF path
                        });

                        // Show Snackbar after PDF generation
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('PDF Generated Successfully!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Generate PDF',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
            const SizedBox(height: 20),
            // If PDF is generated, display it using flutter_pdfview
            if (_pdfFilePath != null)
              Expanded(
                child: PDFView(
                  filePath: _pdfFilePath,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: true,
                  pageFling: true,
                  pageSnap: true,
                  defaultPage: 0,
                  onPageChanged: (int? current, int? total) {
                    print('Current Page: $current of $total');
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RichText(
        text: TextSpan(
          text: title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 16),
          children: [
            TextSpan(
              text: ' $detail',
              style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
