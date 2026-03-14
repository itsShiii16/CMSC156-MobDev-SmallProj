import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Exercise #4',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // Global styling for all text fields to look clean
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
      ),
      home: const FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture user input
  final _nameController = TextEditingController(text: 'mcLOVIN');
  final _heightController = TextEditingController(text: '177.8');
  final _weightController = TextEditingController(text: '68.03');
  final _hairController = TextEditingController(text: 'brown');
  final _eyesController = TextEditingController(text: 'brown');
  final _cityController = TextEditingController(text: 'Honolulu');
  final _addressController = TextEditingController(
      text: '892 Momona St. Honolulu, Hi 96820');

  // For the Dropdown
  String _selectedSex = 'Male';

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _hairController.dispose();
    _eyesController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  // Function to trigger the custom dialog
  void _showIdDialog() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return IdCardDialog(
            name: _nameController.text,
            height: _heightController.text,
            weight: _weightController.text,
            hair: _hairController.text,
            eyes: _eyesController.text,
            sex: _selectedSex,
            city: _cityController.text,
            address: _addressController.text,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input and Forms'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter Details for ID',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'Name', prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(height: 12),
              
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Height (cm)', prefixIcon: Icon(Icons.height)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Weight (kg)', prefixIcon: Icon(Icons.scale)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _hairController,
                      decoration: const InputDecoration(
                          labelText: 'Hair Color', prefixIcon: Icon(Icons.face)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _eyesController,
                      decoration: const InputDecoration(
                          labelText: 'Eye Color', prefixIcon: Icon(Icons.remove_red_eye)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: _selectedSex,
                decoration: const InputDecoration(
                    labelText: 'Sex', prefixIcon: Icon(Icons.wc)),
                items: <String>['Male', 'Female', 'Other']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedSex = newValue!;
                  });
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                    labelText: 'City', prefixIcon: Icon(Icons.location_city)),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _addressController,
                maxLines: 2,
                decoration: const InputDecoration(
                    labelText: 'Address', prefixIcon: Icon(Icons.home)),
              ),
              const SizedBox(height: 24),

              ElevatedButton.icon(
                onPressed: _showIdDialog,
                icon: const Icon(Icons.badge),
                label: const Text('GENERATE SAMPLE ID'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Dialog Widget to replicate the ID layout
class IdCardDialog extends StatelessWidget {
  final String name;
  final String height;
  final String weight;
  final String hair;
  final String eyes;
  final String sex;
  final String city;
  final String address;

  const IdCardDialog({
    super.key,
    required this.name,
    required this.height,
    required this.weight,
    required this.hair,
    required this.eyes,
    required this.sex,
    required this.city,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: const Color(0xFFEBE9F3), // Light purple/grey background
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER Row
              Row(
                children: [
                  const Text(
                    'HAWAII',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'DRIVER LICENSE',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1),
              const SizedBox(height: 8),

              // IMAGE & DETAILS Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  Container(
                    width: 100,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    // Using a network image for McLovin. In a real app, use Image.asset
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/en/thumb/0/03/McLovin.jpg/220px-McLovin.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                          const Center(child: Icon(Icons.person, size: 50)),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Text Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoText('NUMBER: ', '01-47-87441'),
                        _buildInfoText('NAME: ', name),
                        _buildInfoText('HT: ', '$height cm'),
                        _buildInfoText('WT: ', '$weight kg'),
                        const SizedBox(height: 4),
                        _buildInfoText('HAIR: ', hair),
                        _buildInfoText('EYES: ', eyes),
                        const SizedBox(height: 4),
                        _buildInfoText('SEX: ', sex),
                        _buildInfoText('CITY: ', city),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ADDRESS
              const Text('ADDRESS:', style: TextStyle(fontSize: 12)),
              Text(
                address,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),

              // SIGNATURE
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'Signature',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // CLOSE BUTTON
              Center(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    side: const BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to format the text consistently
  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 13),
          children: [
            TextSpan(text: label),
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}