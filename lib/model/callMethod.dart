import 'package:url_launcher/url_launcher.dart';


class Method {

  launchURL(String link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchCaller() async {
    const url = "tel:+8801889143814";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchEmail() async {
    if (await canLaunch("mailto:meetwithrahulreza.com")) {
      await launch("mailto:meetwithrahulreza@gmail.com");
    } else {
      throw 'Could not launch';
    }
  }
}