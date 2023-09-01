import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'res/colors.dart';
import 'utils/pair.dart';

class AddPopup extends StatefulWidget {
  final Pair<double, double>? location;
  const AddPopup({
    super.key,
    this.location,
  });

  @override
  State<StatefulWidget> createState() => _AddPopupState();
}

class _AddPopupState extends State<AddPopup> {
  late String address;

  final InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: MatColors.primary,
      width: 2,
    )
  );

  @override
  void initState() {
    super.initState();
    if (widget.location != null) {
      address = '${widget.location!.first}, ${widget.location!.second}'; // 추후에 Geocoder 연동
    } else {
      address = '장소를 골라보세요!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: AddPopupInput(address: address),
              ),
            ),
            const AddPopupButtons(),
          ],
        ),
      ),
    );
  }
}

class AddPopupInput extends StatelessWidget {
  final String address;
  const AddPopupInput({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) => ListView(
    children: [
      const SizedBox(height: 28,),
      Text(address),
      const SizedBox(height: 10,),
      Align(
        alignment: AlignmentDirectional.center,
        child: RatingBar.builder(
          initialRating: 1,
          minRating: 1,
          allowHalfRating: true,
          unratedColor: MatColors.primary60,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          itemSize: 35,
          itemBuilder: (context, _) => const Icon(
            CupertinoIcons.star_fill,
            color: MatColors.primary,
          ),
          onRatingUpdate: (rating) {

          },
        ),
      ),
      const SizedBox(height: 24,),
      TextField(
        decoration: InputDecoration(
          labelText: '평가를 해보자',
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MatColors.primary, width: 2,)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: MatColors.primary, width: 2,)
          ),
          labelStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: MatColors.primary20,
        ),
        cursorColor: MatColors.primary200,
        minLines: 10,
        maxLines: 10,
        maxLength: 500,
      ),
      const SizedBox(height: 24,),
      const Text('사진 첨부'),
      const SizedBox(height: 10,),
      const AddPopupPictures(),
      const SizedBox(height: 28,),
    ],
  );
}

class AddPopupPictures extends StatefulWidget {
  const AddPopupPictures({super.key});

  @override
  State<StatefulWidget> createState() => _AddPopupPicturesState();
}

class _AddPopupPicturesState extends State<AddPopupPictures> {
  List<Image> pictures = [];

  void addPicture(String path) {
    // TODO : check size limit
    pictures.add(Image.file(
      File(path),
      fit: BoxFit.cover,
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (pictures.isEmpty) {
      return EmptyPictures(onClick: addPicture);
    } else {
      return GridPictures(list: pictures);
    }
  }
}

class EmptyPictures extends StatelessWidget {
  final Function onClick;
  const EmptyPictures({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: Colors.black12,
        strokeWidth: 2,
        dashPattern: const [8, 4],
        child: const Center(
          child: Icon(Icons.add_circle, color: Colors.black12,),
        ),
      ),
    );
  }
}

class GridPictures extends StatelessWidget {
  final List<Image> list;
  const GridPictures({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: const NeverScrollableScrollPhysics(), // no scrollable option
      children: List.generate(4, (index) => Container(
        color: Color.fromARGB(255, (index+1)*50, (index+1)*30, (index+1)*30),
      )),
    );
  }
}

class AddPopupButtons extends StatelessWidget {
  const AddPopupButtons({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.max,
    // crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: SizedBox(
          height: 60,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
              backgroundColor: Colors.white,
            ),
            child: const Text('닫기'),
          ),
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 60,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
              backgroundColor: MatColors.primary,
            ),
            child: const Text('저장', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    ],
  );
}
