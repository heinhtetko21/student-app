// Dart: Existing Libraries
import 'dart:math';

// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Models
import '../../models/student_model.dart';

// Controllers
import '../../controllers/student_controller.dart';

// Widgets
import '../widgets/text_field_widget.dart';

// UpdateStudentPage: StatelessWidget Class
class UpdateStudentPage extends StatelessWidget {
  // Parameter: Class Properties
  final int studentId;
  // Constructor
  UpdateStudentPage({
    required this.studentId,
    super.key,
  });

  // Final: Class Properties
  final String title = "Update Student";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();

  // Action: Class Methods
  void _onInitialize(BuildContext context) {
    final StudentController studentController = Provider.of<StudentController>(
      context,
      listen: false,
    );
    StudentModel filteredStudent = studentController.filterStudent(studentId);
    _studentNameController.text = filteredStudent.name.toString();
    _ageController.text = filteredStudent.age.toString();
    _addressController.text = filteredStudent.address.toString();
    _rollNoController.text = filteredStudent.rollNumber.toString();
  }

  void _onUpdateStudent(BuildContext context) {
    final StudentController studentController = Provider.of<StudentController>(
      context,
      listen: false,
    );
    if (_formKey.currentState!.validate()) {
      final String name = _studentNameController.text.toString();
      final int age = int.parse(_ageController.text.toString());
      final String address = _addressController.text.toString();
      final String rollNumber = _rollNoController.text.toString();
      final StudentModel updatedStudent = StudentModel(
        id: studentId,
        name: name,
        age: age,
        address: address,
        rollNumber: rollNumber,
      );
      studentController.updateStudent(updatedStudent);

      const SnackBar snackBar = SnackBar(
        content: Text(
          'Updated student successfully!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: (Colors.grey),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.of(context).pop();
    }
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Actions in method
    _onInitialize(context);

    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20.0),
                TextFieldWidget(
                  controller: _studentNameController,
                  keyboardType: TextInputType.text,
                  readOnly: false,
                  label: "Name",
                  hint: "Enter student name",
                ),
                TextFieldWidget(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  readOnly: false,
                  label: "Age",
                  hint: "Enter student age",
                ),
                TextFieldWidget(
                  controller: _addressController,
                  keyboardType: TextInputType.streetAddress,
                  readOnly: false,
                  label: "Address",
                  hint: "Enter student address",
                ),
                TextFieldWidget(
                  controller: _rollNoController,
                  keyboardType: TextInputType.text,
                  readOnly: false,
                  label: "Roll Number",
                  hint: "Enter student roll number",
                ),
                const SizedBox(height: 50.0),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () => _onUpdateStudent(context),
                    child: const Text("Update Student"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
