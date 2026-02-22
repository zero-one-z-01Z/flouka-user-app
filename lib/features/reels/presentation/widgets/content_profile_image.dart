import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContentProfileImage extends StatelessWidget {
  final EdgeInsets? margin;
  final String imageUrl;
  final void Function()? onTap;
  const ContentProfileImage({super.key, this.margin, this.onTap, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 16.2.w,
        width: 16.2.w,
        margin: margin,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
                child: Container(
              margin: EdgeInsets.all(2.w),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            )),
            Positioned.fill(
                child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: 
                                CachedNetworkImageProvider(imageUrl),
                                fit: BoxFit.cover))))),
          ],
        ),
      ),
    );
  }
}
