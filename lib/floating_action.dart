import 'package:flutter/material.dart';

class AddExtendButton extends StatelessWidget {
  final Function onClick;
  const AddExtendButton({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 3,
      onPressed: () => onClick(),
      backgroundColor: const Color.fromARGB(255, 255, 110, 110),
      label: const Text('마커 추가하기', style: TextStyle(fontWeight: FontWeight.bold)),
      icon: const Icon(Icons.add),
    );
  }
}

class AddOnCurrentPositionButton extends StatelessWidget {
  const AddOnCurrentPositionButton({super.key});

  void onPressed() {

  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 3,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      label: const Text(
        '현채 마커에서',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 110, 110),
        ),
      ),
      icon: const Icon(
        Icons.location_on_outlined,
        color: Color.fromARGB(255, 255, 110, 110),
      ),
    );
  }
}

class AddOnNewPositionButton extends StatelessWidget {
  const AddOnNewPositionButton({super.key});

  void onPressed() {

  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 3,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      label: const Text(
        '주소 직접입력',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 110, 110),
        ),
      ),
      icon: const Icon(
        Icons.abc,
        color: Color.fromARGB(255, 255, 110, 110),
      ),
    );
  }
}
