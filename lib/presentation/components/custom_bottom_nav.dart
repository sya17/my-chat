import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    void _showPopupMenu(BuildContext context) {
      // final RenderBox button = context.findRenderObject() as RenderBox;
      // final RenderBox overlay =
      //     Overlay.of(context).context.findRenderObject() as RenderBox;

      // Menghitung ukuran layar untuk menampilkan popup di tengah
      final Size screenSize = MediaQuery.of(context).size;

      // final RelativeRect position = RelativeRect.fromRect(
      //   Rect.fromPoints(
      //     button.localToGlobal(
      //       Offset(button.size.width, -button.size.height),
      //       ancestor: overlay,
      //     ),
      //     button.localToGlobal(
      //       button.size.bottomRight(Offset.zero),
      //       ancestor: overlay,
      //     ),
      //   ),
      //   Offset.zero & overlay.size,
      // );
      final RelativeRect position = RelativeRect.fromLTRB(
        screenSize.width / 2 - 90, // Posisi horizontal (di tengah layar)
        screenSize.height - 210, // Posisi vertikal (dekat dengan bottom)
        screenSize.width / 2 + 90, // Menyesuaikan lebar popup (200 px)
        screenSize.height - 150, // Mengatur tinggi dari bagian bawah layar
      );

      showMenu(
        context: context,
        position: position,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(
            layoutStyle.defaultMargin / 5,
          ),
        ),
        items: [
          PopupMenuItem<String>(
            value: 'new-chat',
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: colorStyle.black,
                ),
                SizedBox(
                  width: layoutStyle.defaultMargin / 4,
                ),
                Text(
                  'New Chat',
                  style: textStyle.blackText,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'new-contact',
            child: Row(
              children: [
                Icon(
                  Icons.contact_phone,
                  color: colorStyle.black,
                ),
                SizedBox(
                  width: layoutStyle.defaultMargin / 4,
                ),
                Text(
                  'New Contact',
                  style: textStyle.blackText,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'new-community',
            child: Row(
              children: [
                Icon(
                  Icons.group_add,
                  color: colorStyle.black,
                ),
                SizedBox(
                  width: layoutStyle.defaultMargin / 4,
                ),
                Text(
                  'New Comunity',
                  style: textStyle.blackText,
                ),
              ],
            ),
          ),
        ],
      ).then((value) {
        // Handle menu selection
        print('Selected: $value');
        Get.toNamed('/$value');
      });
    }

    return BottomAppBar(
      // elevation: 100,
      height: layoutStyle.blockVertical * 6,
      color: colorStyle.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                color: colorStyle.white,
                child: Icon(
                  Icons.home,
                  color: colorStyle.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                _showPopupMenu(context);
              },
              child: Container(
                padding: EdgeInsets.all(layoutStyle.defaultMargin / 5),
                decoration: BoxDecoration(
                  color: colorStyle.black,
                  borderRadius: BorderRadius.circular(
                    layoutStyle.defaultMargin,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: colorStyle.white,
                    ),
                    SizedBox(
                      width: layoutStyle.defaultMargin / 5,
                    ),
                    Text(
                      'New Chat',
                      style: textStyle.whiteText,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                color: colorStyle.white,
                child: Icon(
                  Icons.person,
                  color: colorStyle.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
