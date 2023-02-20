import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('تواصل معنا عبر واتساب',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.whatshot),
                    ],
                  ),
                ),
              ),
            ),
            // facebook us
            const SizedBox(
              height: 10,
            ),
            // call us
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('اتصل بنا عبر الهاتف',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.call),
                    ],
                  ),
                ),
              ),
            ),
            // email us
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('راسلنا عبر البريد الإلكتروني',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.email),
                    ],
                  ),
                ),
              ),
            ),
            // message us
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('راسلنا عبر الرسائل القصيرة',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.message),
                    ],
                  ),
                ),
              ),
            ),

            // facebook page
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('صفحتنا على الفيس بوك',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.facebook),
                    ],
                  ),
                ),
              ),
            ),
            // instagram page
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('صفحتنا على الانستغرام',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.facebook),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
