import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sm1/list_items.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

bool isOn = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}

const Color secondaryColor = Colors.red;
const double pad1 = 5;
const humHeight = 60.0;
Color humColor = Colors.blue.shade300;
Color button1 = Colors.white;
Color button2 = Colors.white;
Color text1 = const Color.fromARGB(255, 31, 107, 151);
Color text2 = const Color.fromARGB(255, 31, 107, 151);
Color button3 = Colors.white;
Color button4 = Colors.white;
Color text3 = const Color.fromARGB(255, 130, 141, 29);
Color text4 = const Color.fromARGB(255, 130, 141, 29);
Color button5 = Colors.white;
Color button6 = Colors.white;
Color text5 = const Color.fromARGB(255, 112, 23, 23);
Color text6 = const Color.fromARGB(255, 112, 23, 23);
Color button7 = Colors.white;
Color button8 = Colors.white;
Color text7 = const Color.fromARGB(255, 23, 112, 30);
Color text8 = const Color.fromARGB(255, 23, 112, 30);
String data = "";

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    ////
    ///
    //database ref initiate
    //
    DatabaseReference dzeroRef = FirebaseDatabase.instance.ref('actions/D0');
    DatabaseReference doneRef = FirebaseDatabase.instance.ref('actions/D1');
    DatabaseReference dtwoRef = FirebaseDatabase.instance.ref('actions/D2');
    DatabaseReference dthreeRef = FirebaseDatabase.instance.ref('actions/D3');
    ////
    ///
    //database ref finalise
    //
    dzeroRef.onValue.listen((DatabaseEvent event) {
      final String? actionString = event.snapshot.value as String?;
      if (actionString != null) {
        dzeroChanged(actionString);
      } else {
        // Handle the case where the action string is not available
      }
    });
    doneRef.onValue.listen((DatabaseEvent event) {
      final String? actionString = event.snapshot.value as String?;
      if (actionString != null) {
        doneChanged(actionString);
      } else {
        // Handle the case where the action string is not available
      }
    });
    dtwoRef.onValue.listen((DatabaseEvent event) {
      final String? actionString = event.snapshot.value as String?;
      if (actionString != null) {
        dtwoChanged(actionString);
      } else {
        // Handle the case where the action string is not available
      }
    });
    dthreeRef.onValue.listen((DatabaseEvent event) {
      final String? actionString = event.snapshot.value as String?;
      if (actionString != null) {
        dthreeChanged(actionString);
      } else {
        // Handle the case where the action string is not available
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      ////
      ///
      //Appbar
      //
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        title: const Center(
          child: Text(
            'Smart Living',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            sizeBox1(),
            firstWidget(),
            ////
            ///
            ///Device list
            ///
            SizedBox(height: 150, child: listItems()),
            ////
            ///
            ///Favourite icons
            ///
            secondWidget(),
            ////
            ///
            ///Four columns
            ///
            Row(
              children: [
                Expanded(child: childOne()),
                Expanded(child: childTwo()),
              ],
            ),
            Row(
              children: [
                Expanded(child: childThree()),
                Expanded(child: childFour()),
              ],
            ),
            ////
            ///
            ///Add items
            ///
            Row(
              children: [addContainer(), const Expanded(child: SizedBox())],
            )
          ],
        ),
      ),
    );
  }

  Expanded addContainer() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context, // Assuming you have access to context
            builder: (context) => AlertDialog(
              title: const Text('Add Name'), // Title reflects name input only
              content: const SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: 'Enter name'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    // Handle OK button logic (retrieve name)
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
              backgroundColor: Colors.white,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(62, 69, 187, 108),
            ),
            height: 130,
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 43, 97, 45),
              size: 50,
            ),
          ),
        ),
      ),
    );
  }

  //TODO LIST ITEM
  ListView listItems() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: flist.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 50,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10)),
                content: const Row(
                  children: [
                    Icon(
                      Icons.pin_end_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Device must connect to pin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: flist[index].col,
              ),
              width: 150,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 20,
                      child: flist[index].ico,
                    ),
                    Text(
                      flist[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(flist[index].desc)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  //TODO SECOND ITEMS
  Row secondWidget() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'Favourites',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 80, 42, 42)),
          ),
        ),
      ],
    );
  }

//TODO FIRST ITEM
  Row firstWidget() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'Devices',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 80, 42, 42)),
          ),
        ),
      ],
    );
  }

  SizedBox sizeBox1() {
    return const SizedBox(
      height: 20,
    );
  }

  Padding childOne() {
    return Padding(
      padding: const EdgeInsets.all(pad1),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFDBCD), // Set the color to red
          borderRadius: BorderRadius.circular(20.0), // Set border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lightbulb,
                    color: Color.fromARGB(255, 112, 23, 23),
                  )),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(pad1),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(button1)),
                          onPressed: () {
                            // Code to update value in Firebase Realtime Database
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('actions/D0');
                            databaseReference.set('ON');
                            setState(() {
                              button1 = const Color.fromARGB(255, 112, 23, 23);
                              button2 = Colors.white;
                              text1 = Colors.white;
                              text2 = const Color.fromARGB(255, 112, 23, 23);
                            });
                          },
                          child: Text(
                            'ON',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: text1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(pad1),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(button2)),
                          onPressed: () {
                            // Code to update value in Firebase Realtime Database
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('actions/D0');
                            databaseReference.set('OFF');
                            setState(() {
                              button2 = const Color.fromARGB(255, 112, 23, 23);
                              button1 = Colors.white;
                              text2 = Colors.white;
                              text1 = const Color.fromARGB(255, 112, 23, 23);
                            });
                          },
                          child: Text(
                            'OFF',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: text2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding childTwo() {
    return Padding(
      padding: const EdgeInsets.all(pad1),
      child: Container(
        decoration: BoxDecoration(
          color:
              const Color.fromARGB(255, 205, 239, 255), // Set the color to red
          borderRadius: BorderRadius.circular(20.0), // Set border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.mode_fan_off_rounded,
                    color: Color.fromARGB(255, 31, 107, 151),
                  )),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(pad1),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(button3)),
                          onPressed: () {
                            // Code to update value in Firebase Realtime Database
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('actions/D1');
                            databaseReference.set('ON');
                            setState(() {
                              button3 = const Color.fromARGB(255, 31, 107, 151);
                              button4 = Colors.white;
                              text3 = Colors.white;
                              text4 = const Color.fromARGB(255, 31, 107, 151);
                            });
                          },
                          child: Text(
                            'ON',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: text3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(pad1),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(button4)),
                          onPressed: () {
                            // Code to update value in Firebase Realtime Database
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('actions/D1');
                            databaseReference.set('OFF');
                            setState(() {
                              button4 = const Color.fromARGB(255, 31, 107, 151);
                              button3 = Colors.white;
                              text4 = Colors.white;
                              text3 = const Color.fromARGB(255, 31, 107, 151);
                            });
                          },
                          child: Text(
                            'OFF',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: text4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding childThree() {
    return Padding(
      padding: const EdgeInsets.all(pad1),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFEEFC8), // Set the color to red
          borderRadius: BorderRadius.circular(20.0), // Set border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.tv,
                    color: Color.fromARGB(255, 130, 141, 29),
                  )),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(pad1),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(button5)),
                          onPressed: () {
                            // Code to update value in Firebase Realtime Database
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('actions/D2');
                            databaseReference.set('ON');
                            setState(() {
                              button5 = const Color.fromARGB(255, 130, 141, 29);
                              button6 = Colors.white;
                              text5 = Colors.white;
                              text6 = const Color.fromARGB(255, 130, 141, 29);
                            });
                          },
                          child: Text(
                            'ON',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: text5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(pad1),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(button6)),
                          onPressed: () {
                            // Code to update value in Firebase Realtime Database
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('actions/D2');
                            databaseReference.set('OFF');
                            setState(() {
                              button6 = const Color.fromARGB(255, 130, 141, 29);
                              button5 = Colors.white;
                              text6 = Colors.white;
                              text5 = const Color.fromARGB(255, 130, 141, 29);
                            });
                          },
                          child: Text(
                            'OFF',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: text6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding childFour() {
    return Padding(
      padding: const EdgeInsets.all(pad1),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE0F6DF), // Set the color to red
          borderRadius: BorderRadius.circular(20.0), // Set border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.light,
                    color: Color.fromARGB(255, 112, 23, 23),
                  )),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(pad1),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(button7)),
                          onPressed: () {
                            // Code to update value in Firebase Realtime Database
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('actions/D3');
                            databaseReference.set('ON');
                            setState(() {
                              button7 = const Color.fromARGB(255, 23, 112, 30);
                              button8 = Colors.white;
                              text7 = Colors.white;
                              text8 = const Color.fromARGB(255, 23, 112, 30);
                            });
                          },
                          child: Text(
                            'ON',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: text7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(pad1),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(button8)),
                          onPressed: () {
                            // Code to update value in Firebase Realtime Database
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref()
                                    .child('actions/D3');
                            databaseReference.set('OFF');
                            setState(() {
                              button8 = const Color.fromARGB(255, 23, 112, 30);
                              button7 = Colors.white;
                              text8 = Colors.white;
                              text7 = const Color.fromARGB(255, 23, 112, 30);
                            });
                          },
                          child: Text(
                            'OFF',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: text8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dzeroChanged(String actionString) {
    if (actionString == 'ON') {
      setState(() {
        button1 = const Color.fromARGB(255, 112, 23, 23);
        button2 = Colors.white;
        text1 = Colors.white;
        text2 = const Color.fromARGB(255, 112, 23, 23);
      });
    } else {
      setState(() {
        button2 = const Color.fromARGB(255, 112, 23, 23);
        button1 = Colors.white;
        text2 = Colors.white;
        text1 = const Color.fromARGB(255, 112, 23, 23);
      });
    }
  }

  void doneChanged(String actionString) {
    if (actionString == 'ON') {
      setState(() {
        button3 = const Color.fromARGB(255, 31, 107, 151);
        button4 = Colors.white;
        text3 = Colors.white;
        text4 = const Color.fromARGB(255, 31, 107, 151);
      });
    } else {
      setState(() {
        button4 = const Color.fromARGB(255, 31, 107, 151);
        button3 = Colors.white;
        text4 = Colors.white;
        text3 = const Color.fromARGB(255, 31, 107, 151);
      });
    }
  }

  void dtwoChanged(String actionString) {
    if (actionString == 'ON') {
      setState(() {
        button5 = const Color.fromARGB(255, 130, 141, 29);
        button6 = Colors.white;
        text5 = Colors.white;
        text6 = const Color.fromARGB(255, 130, 141, 29);
      });
    } else {
      setState(() {
        button6 = const Color.fromARGB(255, 130, 141, 29);
        button5 = Colors.white;
        text6 = Colors.white;
        text5 = const Color.fromARGB(255, 130, 141, 29);
      });
    }
  }

  void dthreeChanged(String actionString) {
    if (actionString == 'ON') {
      setState(() {
        button7 = const Color.fromARGB(255, 23, 112, 30);
        button8 = Colors.white;
        text7 = Colors.white;
        text8 = const Color.fromARGB(255, 23, 112, 30);
      });
    } else {
      setState(() {
        button8 = const Color.fromARGB(255, 23, 112, 30);
        button7 = Colors.white;
        text8 = Colors.white;
        text7 = const Color.fromARGB(255, 23, 112, 30);
      });
    }
  }
}
