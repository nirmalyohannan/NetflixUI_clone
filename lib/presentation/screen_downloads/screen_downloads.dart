import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/widgets/widget_app_bar.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final List<String> _imageUrls = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/xAG7S6X73B74CeLjo8gcVoWtunr.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tL1pf85mtn1SEHODLetoHRGdxnN.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bU9q9yVtxeBiC0Do27CekHXNE6D.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: WidgetAppBar(
            title: "Downloads",
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          gapHeight10,
          const _SmartDownloads(),
          gapHeight20,
          gapHeight10,
          const IntroDownloadsDescription(),
          _StackedImages(size: size, imageUrls: _imageUrls),
          const _SetUpButton(),
          const _SeeWhatButton()
        ]),
      ),
    );
  }
}

class IntroDownloadsDescription extends StatelessWidget {
  const IntroDownloadsDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Text(
            "Introducing Downloads for You",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        gapHeight20,
        const Text(
          "We'll download a personalised selection of \n movies and shows for you, so there's \nalways something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }
}

class _SeeWhatButton extends StatelessWidget {
  const _SeeWhatButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: buttonColorWhite,
        onPressed: () {},
        child: const Text(
          "See what you can download",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _SetUpButton extends StatelessWidget {
  const _SetUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: MaterialButton(
        color: buttonColor,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: const Text(
          "Set Up",
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _StackedImages extends StatelessWidget {
  const _StackedImages({
    Key? key,
    required this.size,
    required List<String> imageUrls,
  })  : _imageUrls = imageUrls,
        super(key: key);

  final Size size;
  final List<String> _imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.width,
      child: Center(
        child: Stack(alignment: AlignmentDirectional.center, children: [
          CircleAvatar(
            radius: size.width / 3,
            backgroundColor: Colors.grey[800],
          ),
          DownloadsImage(
            imageUrl: _imageUrls[2],
            size: size.width / 3.5,
            angle: -20 * pi / 180,
            horizontal: -size.width / 4.5,
            vertical: 10,
          ),
          DownloadsImage(
            imageUrl: _imageUrls[1],
            size: size.width / 3.5,
            angle: 20 * pi / 180,
            horizontal: size.width / 4.5,
            vertical: 10,
          ),
          DownloadsImage(
            imageUrl: _imageUrls[0],
            size: size.width / 2.8,
          ),
        ]),
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: iconColor,
        ),
        gapWidth10,
        const Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImage extends StatelessWidget {
  const DownloadsImage(
      {Key? key,
      required this.imageUrl,
      this.horizontal = 0,
      this.vertical = 0,
      this.angle = 0,
      required this.size})
      : super(key: key);

  final String imageUrl;
  final double size;
  final double horizontal;
  final double vertical;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(horizontal, vertical),
      child: Transform.rotate(
        angle: angle,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrl, width: size)),
      ),
    );
  }
}