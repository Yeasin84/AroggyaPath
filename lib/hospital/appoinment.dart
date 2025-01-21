import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pdfsummary.dart'; // Import the pdfsummary.dart file

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _numberController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();

  Map<String, List<String>> _divisions = {};
  String? _selectedDivision;
  List<String> _hospitals = [];

  @override
  void initState() {
    super.initState();
    _loadHospitalData();
  }

  Future<void> _loadHospitalData() async {
    final String response = await rootBundle.loadString('assets/hospital_data.json');
    final Map<String, dynamic> data = json.decode(response);
    final divisionsList = data['divisions'] as List<dynamic>;

    setState(() {
      _divisions = {
        for (var division in divisionsList)
          division['name']: List<String>.from(division['hospitals'])
      };
    });
  }

  // Method to show the confirmation dialog
  Future<bool?> _showConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Appointment'),
          content: const Text('Are you sure you want to book this appointment?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // No
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Yes
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Book Appointment', style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Let’s Book Your Appointment!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),
              Text(
                'Please provide your details and select a hospital to proceed.',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              _buildTextField(_nameController, 'Full Name', Icons.person),
              const SizedBox(height: 15),
              _buildTextField(_ageController, 'Age', Icons.pets_rounded),
              const SizedBox(height: 15),
              _buildTextField(_numberController, 'Phone Number', Icons.phone,
                  inputType: TextInputType.phone),
              const SizedBox(height: 15),
              _buildTextField(_addressController, 'Address', Icons.home),
              const SizedBox(height: 15),
              _buildTextField(_descriptionController, 'সমস্যা লিখুন', Icons.description,
                  maxLines: 3),
              const SizedBox(height: 20),
              const Text(
                'Select Division:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedDivision,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                items: _divisions.keys
                    .map((division) => DropdownMenuItem(
                          value: division,
                          child: Text(division),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDivision = value;
                    _hospitals = _divisions[_selectedDivision!] ?? [];
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Available Hospitals:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),
              _hospitals.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _hospitals.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            tileColor: Colors.teal[50],
                            title: Text(
                              _hospitals[index],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward, color: Colors.teal),
                            onTap: () async {
                              // Show the confirmation dialog before navigating to AppointmentPdfPage
                              bool? isConfirmed = await _showConfirmationDialog(context);

                              // If the user confirmed, navigate to AppointmentPdfPage
                              if (isConfirmed == true) {
                                Navigator.push(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AppointmentPdfPage(
                                      name: _nameController.text,
                                      age: _ageController.text,
                                      number: _numberController.text,
                                      address: _addressController.text,
                                      description: _descriptionController.text,
                                      hospital: _hospitals[index],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    )
                  : Text(
                      'No hospitals available. Select a division.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon,
      {TextInputType inputType = TextInputType.text, int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
