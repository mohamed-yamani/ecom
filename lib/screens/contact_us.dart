import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  void sendWhatsAppMessage() async {
    final Uri url = Uri(
      scheme: 'https',
      path: 'wa.me/+212677005549',
      queryParameters: <String, String>{
        'text': 'مرحبا بك في موقع ماروك بيوتي',
      },
    );

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<bool> sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    return await launchUrl(launchUri);
  }

  // send sms
  Future<bool> sendSms(String sms) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: sms,
    );
    return await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // icon and title
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تواصلي معنا',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),

            Text(
              'يسعدنا تواصلك معنا',
              style: Theme.of(context).textTheme.titleSmall,
            ),

            const SizedBox(
              height: 60,
            ),

            InkWell(
              onTap: () {
                sendWhatsAppMessage();
              },
              child: Container(
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
                        Text('تواصلي معنا عبر واتساب',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // facebook us
            const SizedBox(
              height: 10,
            ),
            // call us
            InkWell(
              onTap: () {
                _makePhoneCall('+212677005549');
              },
              child: Container(
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
                        Text('اتصلي بنا',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(CupertinoIcons.phone, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // email us
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                sendEmail('moyamani1337@gmail.com');
              },
              child: Container(
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(FontAwesomeIcons.envelope, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // message us
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                sendSms('+212677005549');
              },
              child: Container(
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(FontAwesomeIcons.sms, color: Colors.white),
                      ],
                    ),
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
