import 'package:matcher/matcher.dart';

class Storys {
  String urlName;
  String nikname;

  Storys({required this.urlName, required this.nikname});

  static List<Storys> name = [
    Storys(
        urlName: 'https://avatars.githubusercontent.com/u/108320639?v=4',
        nikname: 'Your story'),
    Storys(urlName: 'https://i.pravatar.cc/300?img=23', nikname: 'Isabella'),
    Storys(urlName: 'https://i.pravatar.cc/300?img=7', nikname: 'KarolBary'),
    Storys(urlName: 'https://i.pravatar.cc/300?img=8', nikname: 'Waggles'),
    Storys(urlName: 'https://i.pravatar.cc/300?img=9', nikname: 'Cherine_001'),
    Storys(urlName: 'https://i.pravatar.cc/300?img=11', nikname: 'Jorj_007'),
    Storys(urlName: 'https://i.pravatar.cc/300?img=10', nikname: 'Alina'),
    Storys(urlName: 'https://i.pravatar.cc/300?img=12', nikname: 'Andrey'),
  ];
}

class Posts {
  String time;
  String image;
  String celsi;

  Posts({required this.time, required this.image, required this.celsi});

  static List<Posts> post = [
    Posts(time: 'Prepare for\nyour first\nskateboard\njump', image: 'https://i.pravatar.cc/300?img=7', celsi: 'Karol Bary\n2 weeks ago'),
    Posts(time: 'Prepare for\nyour first\nskateboard\njump', image: 'https://i.pravatar.cc/300?img=4', celsi: 'Thomos Hope\n4 weeks ago'),
  ];

  static List<Posts> post_1 = [
    Posts(time: 'Prepare for your first\nskateboard jump', image: 'https://i.pravatar.cc/300?img=52', celsi: 'Jordan Wise\n125.908 viwes 2 days ago'),
    Posts(time: 'Basic how to ride your\nsceatbord comfortly', image: 'https://i.pravatar.cc/300?img=12', celsi: 'Jordan Wise\n125.908 viwes 2 days ago'),
  ];
}
