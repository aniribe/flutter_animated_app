import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard;
  final String stateMachineName;
  final String title;
  final String src;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.stateMachineName,
    required this.artboard,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}
