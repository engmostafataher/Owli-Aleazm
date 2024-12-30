
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 210,
        ),
        BuildHeaderBackground(),
        BuildProfileAvatar(),
      ],
    );
  }
}

class BuildHeaderBackground extends StatelessWidget {
  const BuildHeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: const BoxDecoration(
        color: AppColor.kPaleButterYellowColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(100),
          bottomLeft: Radius.circular(100),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25,
          right: 16,
          left: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //  IconButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   }, icon: Icon(Icons.arrow_back_ios_new_outlined,
            //   size: 20,),
              
            // ),
            const SizedBox(width: 60),
            Text(
              "الملف  الشخصي",
              style: Styles.textStyle20.copyWith(
                color: AppColor.kBlackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildProfileAvatar extends StatelessWidget {
  const BuildProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 0,
      right: 110,
      child: Column(
        children: [
           CircleAvatar(
            radius: 50,
            backgroundColor: AppColor.kPrimaryColor,
            child: CircleAvatar(
              radius: 47,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXXckRlC33zt7zHBLpEEEeqY_MGIn89LOdGw&s'),
              // backgroundImage: NetworkImage('${FirebaseAuth.instance.currentUser!.photoURL}?? https://png.pngtree.com/png-vector/20230831/ourmid/pngtree-man-avatar-image-for-profile-png-image_9197908.png'),
            ),
          ),
          // Text(
          //   "${FirebaseAuth.instance.currentUser!.displayName}",
          //   style: Styles.textStyle20.copyWith(
          //     color: AppColor.kBlackColor,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
        ],
      ),
    );
  }
}
