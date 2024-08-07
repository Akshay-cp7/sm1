import 'package:flutter/material.dart';

class Fclass {
  String name;
  String desc;
  Icon ico;
  Color col;

  Fclass(
      {required this.name,
      required this.desc,
      required this.ico,
      required this.col});
}

//TODO FIRST CLASS
final List<Fclass> flist = [
  Fclass(
      name: "Camera", //TODO CAMERA
      desc: '1',
      ico: const Icon(
        Icons.camera,
        size: 40,
        color: Color.fromARGB(255, 82, 87, 19),
      ),
      col: const Color.fromARGB(94, 211, 241, 41)),
  Fclass(
      name: "Wifi", //TODO WIFI
      desc: '2',
      ico: const Icon(
        Icons.wifi,
        size: 40,
        color: Color.fromARGB(255, 41, 95, 43),
      ),
      col: const Color.fromARGB(97, 142, 206, 40)),
  Fclass(
      name: "Speaker",
      desc: '1',
      ico: const Icon(Icons.speaker,
          size: 40, color: Color.fromARGB(255, 19, 67, 107)),
      col: const Color.fromARGB(92, 54, 170, 238)),
  Fclass(
      name: "Blinds", //TODO W1
      desc: '4',
      ico: const Icon(Icons.blinds_closed,
          size: 40, color: Color.fromARGB(255, 107, 54, 19)),
      col: const Color.fromARGB(92, 238, 158, 54)),
];
