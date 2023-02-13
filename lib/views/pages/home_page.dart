// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Controllers
import '../../controllers/student_controller.dart';

// Pages
import './create_student_page.dart';

// Widget
import '../widgets/student_list_cell_widget.dart';

// HomePage: StatelessWidget Class
class HomePage extends StatelessWidget {
  // Constructor
  const HomePage({super.key});

  // Final: Class Properties
  final String title = "Student List";

  // Action: Class Methods
  void _addNewStudent(BuildContext context) {
    print("----- Adding New Student -----");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => CreateStudentPage(),
      ),
    );
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final StudentController studentController = Provider.of(
      context,
      listen: true,
    );

    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: (studentController.getStudentList.isEmpty)
            ? const Center(
                child: Text(
                  "There is no student in the list. \n Create one!",
                  textAlign: TextAlign.center,
                ),
              )
            : ListView(
                children: [
                  const SizedBox(height: 5.0),
                  ...studentController.getStudentList
                      .map(
                        (student) => StudentListCellWidget(
                          student: student,
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 5.0),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewStudent(context),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
