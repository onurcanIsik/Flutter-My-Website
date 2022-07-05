import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Onurcan Işık",
                  style: GoogleFonts.comfortaa(),
                ),
              ),
              Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Center(child: Icon(Icons.star_border)),
                    Center(
                      child: Text(
                        "100",
                        style:
                            GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            decoration: InputDecoration(
              label: Text(
                "Title",
                style: GoogleFonts.comfortaa(color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              textAlign: TextAlign.start,
              maxLines: null,
              expands: true,
              maxLength: 250,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.delete,
                  color: Colors.deepOrange,
                ),
                label: Text(
                  "Description",
                  style: GoogleFonts.comfortaa(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.orange,
              ),
              child: TextButton(
                child: Text(
                  "Share",
                  style: GoogleFonts.comfortaa(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        )
      ],
    );
  }
}

class GofyMainWidget extends StatefulWidget {
  const GofyMainWidget({Key? key}) : super(key: key);

  @override
  State<GofyMainWidget> createState() => _GofyMainWidgetState();
}

class _GofyMainWidgetState extends State<GofyMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 100,
        width: 950,
        child: ListView(
          children: const [
            Card(
              elevation: 10,
              child: ListTile(
                trailing: Icon(Icons.star_border),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30,
                ),
                title: Text("Nabersiniz arkadaşlar ?"),
                subtitle: Text(
                    "Sizlere bir sorum olucaktı bu uygulamayı nasıl yapabilirim ? Flutter yükliyip çözebilir miyim ?"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
