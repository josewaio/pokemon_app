import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pokemood/extensions/context/build_context_extension.dart';

class DrawerAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('POKEMON', style: TextStyle(fontFamily: 'pokemon',fontSize: context.getHeight(.04))),
      centerTitle: true,
      elevation: 1,
      backgroundColor: Colors.amberAccent,
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.amberAccent,
              content: Center(
                  child: Text(
                'Jose\'s Pokedex APP AT Sistemas\n\n2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.center,
              )),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              ),
            ),
          ),
          tooltip: 'Información',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
