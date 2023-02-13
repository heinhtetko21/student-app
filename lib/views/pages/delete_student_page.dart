// Dart: Existing Libraries

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

// DeleteStudentPage: StatelessWidget Class
class DeleteStudentPage extends StatelessWidget {
  // Parameter: Class Properties
  final int studentId;

  // Constructor
  DeleteStudentPage({
    required this.studentId,
    super.key,
  });

  // Final: Class Properties
  final String title = "Delete Student";
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

  void _onDeleteStudent(BuildContext context) {
    final StudentController studentController = Provider.of<StudentController>(
      context,
      listen: false,
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Delete Student"),
      content: const Text("Are you sure to delete this student?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            studentController.deleteStudent(studentId);

            // To close model/dialog
            Navigator.of(context).pop();

            const SnackBar snackBar = SnackBar(
              content: Text(
                'Deleted student successfully!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: (Colors.grey),
              duration: Duration(seconds: 3),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            // To pop up from the existing page.
            Navigator.of(context).pop();
          },
          child: const Text("Delete"),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
                  readOnly: true,
                  label: "Name",
                  hint: "Enter student name",
                ),
                TextFieldWidget(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  readOnly: true,
                  label: "Age",
                  hint: "Enter student age",
                ),
                TextFieldWidget(
                  controller: _addressController,
                  keyboardType: TextInputType.streetAddress,
                  readOnly: true,
                  label: "Address",
                  hint: "Enter student address",
                ),
                TextFieldWidget(
                  controller: _rollNoController,
                  keyboardType: TextInputType.text,
                  readOnly: true,
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
                    onPressed: () => _onDeleteStudent(context),
                    child: const Text("Delete Student"),
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
