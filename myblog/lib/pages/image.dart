import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List images = const [
    AssetImage("Assets/Images/imagePage/wp1.jpeg"),
    AssetImage("Assets/Images/imagePage/wp2.jpeg"),
    AssetImage("Assets/Images/imagePage/wp3.jpeg"),
    AssetImage("Assets/Images/imagePage/wp4.jpeg"),
    AssetImage("Assets/Images/imagePage/wp5.jpeg"),
    AssetImage("Assets/Images/imagePage/wp6.jpeg"),
    AssetImage("Assets/Images/imagePage/wp7.jpeg"),
    AssetImage("Assets/Images/imagePage/wp8.jpeg"),
    AssetImage("Assets/Images/imagePage/wp9.jpeg"),
    AssetImage("Assets/Images/imagePage/wp10.jpeg"),
    AssetImage("Assets/Images/imagePage/wp11.jpeg"),
    AssetImage("Assets/Images/imagePage/wp12.jpeg"),
    AssetImage("Assets/Images/imagePage/wp13.jpeg"),
    AssetImage("Assets/Images/imagePage/wp14.jpeg"),
    AssetImage("Assets/Images/imagePage/wp15.jpeg"),
    AssetImage("Assets/Images/imagePage/wp16.jpeg"),
    AssetImage("Assets/Images/imagePage/wp17.jpeg"),
    AssetImage("Assets/Images/imagePage/wp18.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: images.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 800,
                      width: 800,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: images[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
