import 'package:flutter/material.dart';

class CommonBgImageLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String image,title;
  const CommonBgImageLayout({super.key, this.onTap, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black87,
                image: DecorationImage(
                    image: AssetImage(
                        image),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha:0.7),
                        BlendMode.dstATop))),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
