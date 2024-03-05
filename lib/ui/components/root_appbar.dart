import 'package:flutter/material.dart';

AppBar rootAppBar(BuildContext context) {
  return AppBar(
    leading: Builder(
      builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.sort)),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: IconButton(
          icon: const Icon(Icons.wallet_giftcard),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              backgroundColor: Colors.white,
              elevation: 0,
              isScrollControlled: true,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              showDragHandle: true,
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                  ),
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 100),
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    ],
  );
}
