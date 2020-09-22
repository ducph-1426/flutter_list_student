import 'package:flutter/material.dart';
import 'package:flutter_list_student/Student.dart';

List<Student> students = List<Student>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Work',
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    students.add(Student('Nguyen Ngoc Hieu', 'Math', 9));
    students.add(Student('Nguyen Duc Anh', 'Physics', 8));
    students.add(Student('Tran Van Nghia', 'Geography', 8.5));
    students.add(Student('Nguyen Quoc Anh', 'Literature', 7));
    students.add(Student('Do Van Khai', 'Chemistry', 8));
    students.add(Student('Vu Manh Linh', 'History', 8.5));
  }

  void _addStudent() {
    String name, subject;
    double point;
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Center(
          child: Text('Add Student'),
        ),
        content: Container(
          height: 210,
          child: Column(
            children: [
              new TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                onChanged: (String value) {
                  name = value;
                },
              ),
              SizedBox(height: 16),
              new TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter subject',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                onChanged: (String value) {
                  subject = value;
                },
              ),
              SizedBox(height: 16),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter point',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                onChanged: (String value) {
                  point = double.parse(value);
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              if (name != null && subject != null && point != null) {
                Student student = new Student(name, subject, point);
                students.add(student);
                setState(() {});
                Navigator.of(context).pop();
              }
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            child: ListTile(
              title: Text(student.subject),
              subtitle: Text(student.name),
              trailing: Padding(
                padding: EdgeInsets.only(right: 32),
                child: Text(student.point.toString()),
              ),
              leading: CircleAvatar(
                child: Text(student.subject.substring(0, 1)),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    title: Center(
                      child: new Text('Update Student Info'),
                    ),
                    content: Container(
                      height: 210,
                      child: Column(
                        children: [
                          new TextFormField(
                            onChanged: (String value) {
                              student.name = value;
                            },
                            initialValue: student.name,
                            decoration: InputDecoration(
                              hintText: 'Enter name',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          new TextFormField(
                            onChanged: (String value) {
                              student.subject = value;
                            },
                            initialValue: student.subject,
                            decoration: InputDecoration(
                              hintText: 'Enter subject',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          new TextFormField(
                            onChanged: (String value) {
                              student.point = double.parse(value);
                            },
                            initialValue: student.point.toString(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter point',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Update'),
                        onPressed: () {
                          if (student.name != null &&
                              student.point != null &&
                              student.subject != null) {
                            setState(() {});
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    content: Text('Are you sure want to delete this ?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('NO'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('YES'),
                        onPressed: () {
                          setState(() {
                            students.removeAt(index);
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStudent,
        child: Icon(Icons.add),
      ),
    );
  }
}
