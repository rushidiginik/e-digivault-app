import 'package:e_digivault_org_app/core/constants/image_const.dart';
import 'package:e_digivault_org_app/core/constants/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderAction extends StatelessWidget {
  const HeaderAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // 🔑 critical
      children: [
        _icon(
          ImageConst.messagesIconPNG,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) => const MessageListScreen()),
            // );
          },
        ),
        const SizedBox(width: 8),
        _icon(
          ImageConst.notificationsIconPNG,
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) => NotificationsScreen()),
            // );
          },
          flip: true,
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 20, // fixed px works better in AppBar
          backgroundImage: const NetworkImage(
            "https://randomuser.me/api/portraits/men/32.jpg",
          ),
        ),
      ],
    );
  }

  Widget _icon(String asset, {required VoidCallback onTap, bool flip = false}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppStyles.primaryColor.withOpacity(0.1),
        child: Transform(
          alignment: Alignment.center,
          transform: flip ? Matrix4.rotationY(3.1416) : Matrix4.identity(),
          child: Image.asset(asset, height: 25),
        ),
      ),
    );
  }
}

// class HeaderAction extends StatelessWidget {
//   final IconData? icon;
//   final String? label;
//   const HeaderAction({super.key, this.icon, this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//     //  crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () {
//            // Navigator.pushNamed(context, NavigatorConst.messageListScreen);
//             Navigator.push(context, MaterialPageRoute(builder: (context) => const MessageListScreen()));
//           //  Navigator.pushNamed(context, NavigatorConst.messageListScreen);
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: CircleAvatar(
//               backgroundColor: AppStyles.primaryColor.withValues(alpha: 0.1),
//              child:  Image.asset(ImageConst.messagesIconPNG,height:24.sp,),
//             ),
//           ),

//         ),
//         const SizedBox(width: 12),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
//           //  Navigator.pushNamed(context, NavigatorConst.viewAllNotificationScreen);
//           },
//            child: CircleAvatar(
//             backgroundColor: AppStyles.primaryColor.withValues(alpha: 0.1),
//             child: Transform(
//               alignment: Alignment.center,
//               transform: Matrix4.rotationY(3.1416), // π radians = 180°
//               child: Image.asset(ImageConst.notificationsIconPNG,height:24.sp,),),
//             ),
//           ),
//           // child: CircleAvatar(
//           //   backgroundColor: AppStyles.primaryColor.withValues(alpha: 0.1),
//           //   child: Icon(Icons.message_outlined, color: AppStyles.primaryColor, size: 24.sp),
//           // ),
//        // ),
//         const SizedBox(width: 12),
//         GestureDetector(
//           onTap: () {
//           //  Navigator.pushNamed(context, NavigatorConst.profileScreen);
//           },
//           child: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/32.jpg")),
//         ),
//       ],
//     );
//   }
// }
