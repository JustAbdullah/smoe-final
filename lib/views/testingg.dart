import 'package:flutter/material.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class MyAppNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pusher Channels Flutter'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pusher;
  int rowCount = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pusher = PusherChannelsFlutter();
    initPusher();
    Future.delayed(const Duration(seconds: 3), () async {
      initPusher();
    });
    initPusher();
    Future.delayed(const Duration(seconds: 10), () async {
      initPusher();
    });
    Future.delayed(const Duration(seconds: 15), () async {
      initPusher();
    });
  }

  Future<void> initPusher() async {
    try {
      await pusher.init(
        apiKey: "a4e94a6f9e20e0a5b3ce",
        cluster: "ap1",
      );
      await pusher.connect();
      final myChannel = await pusher.subscribe(
        channelName: "products",
        onEvent: onEvent,
      );
      _showSnackBar('تم الاتصال بنجاح');
    } catch (e) {
      print(e);
      _showSnackBar('حدث خطأ أثناء الاتصال: $e');
      print('$e');
    }
  }

  void onEvent(dynamic event) {
    try {
      PusherEvent pusherEvent = event as PusherEvent;
      if (pusherEvent.eventName == 'ProductUpdated') {
        setState(() {
          rowCount = int.parse(pusherEvent.data['rowCount']);
        });
        _showSnackBar('تم جلب البيانات بنجاح');
      }
    } catch (e) {
      _showSnackBar('حدث خطأ أثناء جلب البيانات: $e');
      print('$e------------------------------خطا');
      print('$e------------------------------خطا جلب البيانات خطا خطا خطا ');
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Text(
          'عدد الصفوف في جدول المنتجات: $rowCount',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
