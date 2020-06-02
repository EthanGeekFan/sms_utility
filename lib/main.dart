import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'functions/utility.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMS Util',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SMS Utility'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Future<List<SmsMessage>> content;

  void _refreshMessages() {
    setState(() {
      content = getSmsOf('19117647026');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text('Yifan Yang'),
              accountEmail: new Text('yangyifan529@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                child: Icon(Icons.message),
                radius: 35.0,
              ),
            ),
            ListTile(
              title: Text('Urumqi No.1 Senior High School'),
              leading: new CircleAvatar(
                child: new Icon(Icons.school),
              ),
            ),
            ListTile(
              title: Text('1195767760'),
              leading: new CircleAvatar(
                child: new Text('QQ'),
              ),
            ),
            ListTile(
              title: Text('https://github.com/EthanGeekFan/sms_utility'),
              leading: new CircleAvatar(
                child: new Icon(Icons.list),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: content,
          // initialData: [],
          builder: (BuildContext context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      // return Text(snapshot.data[index].body);
                      return ListTile(
                        title: Text(snapshot.data[index].date.toString()),
                        subtitle: Text(snapshot.data[index].body),
                      );
                    },
                  )
                : Text('No Message Available');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshMessages,
        tooltip: 'Refresh',
        child: content == null ? Icon(Icons.get_app) : Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
