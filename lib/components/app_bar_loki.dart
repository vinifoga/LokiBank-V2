import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarLoki extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final bool mostraImagem;

  const AppBarLoki({Key? key, required this.appBarTitle, required this.mostraImagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 88,
      backgroundColor: const Color(0xff198314),
      title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: mostraImagem,
              child: Image.asset(
                "images/logo.png",
                fit: BoxFit.contain,
                height: 52,
              ),
            ),
            Text(
              appBarTitle,
              style: GoogleFonts.berkshireSwash(),
            )
          ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}