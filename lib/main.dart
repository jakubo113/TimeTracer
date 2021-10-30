import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Activity {
  String track;
  DateTime timeStamp;

  Activity({this.track, this.timeStamp});
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tracks = [];
  List<DateTime> timeStamp = [];

  List<Activity> activities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time tracer"),
      ),
      body: getList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          activities.add(Activity(track: "", timeStamp: DateTime.now()));

          // tracks = addToListElement("", tracks);
          // timeStamp.add(DateTime.now());
          debugPrint(tracks.toString());
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<String> addToListElement(String text, List pole) {
    pole.add(text);
    return pole;
  }

  Widget getList() {
    // var list = ListView.builder(
    //     itemCount: activities.length,
    //     itemBuilder: (BuildContext ctxt, int index) {
    //       return ListTile(
    //         title: Text(activities[index].timeStamp.toString()),
    //         subtitle: Text(activities[index].track),
    //         onTap: () {
    //           debugPrint("klikam");
    //           alertDialog(context);
    //         },
    //       );
    //     });

    List<ListTile> listItems = activities
        .map((activity) => ListTile(
              title: Text(activity.timeStamp.toString()),
              subtitle: Text(activity.track),
              onTap: () {
                debugPrint("klikam");
                alertDialog(context);
              },
            ))
        .toList();

    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat.Hms().format(now);

    return Column(
      children: [
        Text(formattedDateTime),
        Expanded(
            child: ListView(
          children: listItems,
        ))
      ],
    );
  }

  void alertDialog(BuildContext context) {
    var alDialog = AlertDialog(
      title: Text('Uprava aktivity'),
      content: Expanded(
        child: Column(
          children: [
            TextFormField(
              initialValue: 'Toto je form field',
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Ulozit'),
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alDialog;
      },
    );
  }
}
