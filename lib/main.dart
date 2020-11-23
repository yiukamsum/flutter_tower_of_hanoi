import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return MaterialApp(
      title: 'Tower of Hanoi',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Disk {
  final int diskSize;
  final int currentRodId;
  bool draggable;

  Disk(
      {@required this.diskSize,
      @required this.currentRodId,
      this.draggable});
}

class Step {
  final String source;
  final String destination;

  Step({
    @required this.source,
    @required this.destination
  });

  String toString(){
    return "Source: " + source + ", Destination: " + destination;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int numberOfDisks = 4;
  double rodHeight = 170;
  double diskWidth = 30;
  List<Disk> listD1 = [];
  List<Disk> listD2 = [];
  List<Disk> listD3 = [];
  List<Step> step = [];
  int currentStep = 0;
  void hanoi(int discs, String source, String auxiliary, String destination) {
    if(discs > 0){
      hanoi(discs - 1, source, destination, auxiliary);
      step.add(Step(
        source: source,
        destination: destination,
      ));
      hanoi(discs - 1, auxiliary, source, destination);
    }
  }

  @override
  void initState() {
    setState(() {
      currentStep = 0;
      listD1 = [];
      listD2 = [];
      listD3 = [];
      step = [];
      for(int i = 0; i < numberOfDisks; i++) {
        listD1.add(Disk(diskSize: numberOfDisks - i, currentRodId: 1, draggable: false));
      }
    });
    hanoi(numberOfDisks, "A", "B", "C");
    // debugPrint(step.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Tower of Hanoi"),
        elevation: 0,
      ),
      backgroundColor: Colors.lightBlue[100],
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Colors.lightGreen,
            height: MediaQuery.of(context).size.height - 300,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            child: Container(
                              color: Colors.blueGrey,
                              height: rodHeight,
                              width: 12,
                            ),
                          ),
                          for (int i = 0; i < listD1.length; i++)
                            Positioned(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      Colors.deepOrange[100],
                                      Colors.deepOrange[200],
                                      Colors.deepOrange[300],
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                                  // color: Colors.deepOrange[300],
                                  height: diskWidth == 0 ? 0 : 30,
                                  width: listD1[i].diskSize * 50.0,
                                ),
                              ),
                              bottom: 30.0 * i,
                            ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 300,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            child: Container(
                              color: Colors.blueGrey,
                              height: rodHeight,
                              width: 12,
                            ),
                          ),
                          for (int i = 0; i < listD2.length; i++)
                            Positioned(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      Colors.deepOrange[100],
                                      Colors.deepOrange[200],
                                      Colors.deepOrange[300],
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                                  // color: Colors.deepOrange[300],
                                  height: diskWidth == 0 ? 0 : 30,
                                  width:  listD2[i].diskSize * 50.0,
                                ),
                              ),
                              bottom: 30.0 * i,
                            ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 300,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            child: Container(
                              color: Colors.blueGrey,
                              height: rodHeight,
                              width: 12,
                            ),
                          ),
                          for (int i = 0; i < listD3.length; i++)
                            Positioned(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      Colors.deepOrange[100],
                                      Colors.deepOrange[200],
                                      Colors.deepOrange[300],
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                                  // color: Colors.deepOrange[300],
                                  height: diskWidth == 0 ? 0 : 30,
                                  width:  listD3[i].diskSize * 50.0,
                                ),
                              ),
                              bottom: 30.0 * i,
                            ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 200,
                  height: 80,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Restart Game'),
                    onPressed: (){
                      setState(() {
                        askForNumber(context);
                      });
                    }
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  height: 80,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Back'),
                    onPressed: (){
                      setState(() {
                        if(currentStep == 0){
                          alert(context, "No More Step");
                          return;
                        }
                        Disk movingDisk;
                        currentStep--;
                        switch (step[currentStep].destination) {
                          case "A":
                            movingDisk = listD1.removeLast();
                            break;
                          case "B":
                            movingDisk = listD2.removeLast();
                            break;
                          case "C":
                            movingDisk = listD3.removeLast();
                            break;
                          default:
                        }
                        switch (step[currentStep].source) {
                          case "A":
                            listD1.add(movingDisk);
                            break;
                          case "B":
                            listD2.add(movingDisk);
                            break;
                          case "C":
                            listD3.add(movingDisk);
                            break;
                          default:
                        }
                      });
                    }
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  height: 80,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Next'),
                    onPressed: (){
                      setState(() {
                        Disk movingDisk;
                        if(currentStep >= step.length){
                          alert(context, "No More Step");
                          return;
                        }
                        switch (step[currentStep].source) {
                          case "A":
                            movingDisk = listD1.removeLast();
                            break;
                          case "B":
                            movingDisk = listD2.removeLast();
                            break;
                          case "C":
                            movingDisk = listD3.removeLast();
                            break;
                          default:
                        }
                        switch (step[currentStep].destination) {
                          case "A":
                            listD1.add(movingDisk);
                            break;
                          case "B":
                            listD2.add(movingDisk);
                            break;
                          case "C":
                            listD3.add(movingDisk);
                            break;
                          default:
                        }
                        currentStep++;
                      });
                    }
                  ),
                ),
              ],
            ),
          )
          ],
      ),
    );
  }

  void alert(BuildContext context, text) {
    AlertDialog dialog = AlertDialog(
      title: Text("Alert"),
      content: Text(text),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () => Navigator.of(context).pop(), //关闭对话框
        ),
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }

  void askForNumber(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.deepOrange[50],
          title: Text(
            'Choose initial number of disks',
            softWrap: true,
            style: TextStyle(color: Colors.lightBlue),
          ),
          titlePadding:
              EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          actions: <Widget>[
            NumberPicker.integer(
              scrollDirection: Axis.vertical,
              minValue: 2,
              maxValue: 6,
              initialValue: this.numberOfDisks,
              itemExtent: 30,
              onChanged: (selectedNumber) {
                numberOfDisks = selectedNumber;
                initState();
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                main();
                if (numberOfDisks != null) {
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        );
      }
    );
  }
}
