import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:io';
import 'dart:math';

import 'AppUtils.dart';
import 'CounterUtil.dart';
import 'MitakePingSet.dart';
import 'countly_worker.dart';

CounterUtil? counterUtil;
Future<void> main() async {
  // print("main isolate start");
  // create_isolate();
  // print("main isolate end");

  // testUri();
  // testForEachReturn()

  // await testIsolate();
  // testIsolateWorker();

  // for(int i = 0; i < 10; i++) {
  //   print(generateRandomString());
  // }

  // testStreamController();
  // testStreamFromIterable();
  // testStreamFromFuture();
  // testStreamFromPeriodic();

  // testStreamProducerConsumer();

  // testSubString();

  // testTimer();
  // testTimerFutureStreamMicrotask();

  // var deviceId = '0A33942-CF79-4045-8AA8-0E14C00981ED \r\n\r\n\r\n &';
  // print(deviceId);
  // deviceId = deviceId.replaceAll('\r', '').replaceAll('\n', '').replaceAll(' ', '');
  // print(deviceId);

  // testMap();

  // testRandomList();

  // print(getRandomID(36));

  // testListRemove();

  // testLoopAwait();

  // testPostBackgroundTask();

  // 测试闭包
  // testClosureFunction();


  // testFuture();

  // testCountUtil();

  // testString();

  // testSet();

  // testTimeCompare();

  // String str = insertStr("4131413", 0, "addStr");
  // print(str);
  // sprintf("%08d", 111);

  String str = "a,b,c,d,e";
  List<String> list = str.splitLimit(",", 3);
  list.forEach((element) {print(element);});
}

extension StringExtension on String {
  List<String> splitLimit(String separator, [int limit = 0]) {
    String string = this;
    List<String> result = [];

    if (separator.isEmpty) {
      result.add(string);
      return result;
    }

    if(limit <= 0) {
      return string.split(separator);
    }

    while (true) {
      var index = string.indexOf(separator, 0);
      if (index == -1 || (limit > 0 && result.length >= limit - 1)) {
        result.add(string);
        break;
      }

      result.add(string.substring(0, index));
      string = string.substring(index + separator.length);
    }

    return result;
  }
}

String insertStr(String string, int index, String addStr){
  if (string != null && string.length >= index && index >= 0) {
  // StringBuffer stringBuilder = StringBuffer(string);
  // stringBuilder.insert(index, addStr);
  // return stringBuilder.toString();
  String t1 = string.substring(0, index);
  String t2 = string.substring(index, string.length);
  return t1 + addStr + t2;
  }
  return string;
}

void testTimeCompare() {
  String src = "auth;https://yunqzl1.sseinfo.com:22019,http://114.80.155.134:22016,http://114.80.155.134:22016,http://114.80.155.134:22016,http://114.80.155.134:22016,http://[240e:96c:200:1f02:0:c10:a5b:1f8]:22016,@echo;https://yunqzl1.sseinfo.com:22019,http://114.80.155.134:22016,http://114.80.155.134:22016,http://114.80.155.134:22016,http://114.80.155.134:22016,http://[240e:96c:200:1f02:0:c10:a5b:1f8]:22016,@tcphkd1;tcp://114.80.63.248:22017,tcp://[240e:96c:200:1f02:0:c10:a5b:1f8]:7711,tcp://114.80.155.139:22017,@hkd1;http://114.80.155.139:22016,http://[240e:96c:200:1f02:0:c10:a5b:1f8]:7710,https://yunqzyshk.sseinfo.com:22019,http://114.80.63.248:22016,@cff;http://114.80.155.134:22016,http://[240e:96c:200:1f02:0:c10:a5b:1f8]:22016,@tcphka1;tcp://114.80.155.133:22017,tcp://[240e:96c:200:1f02:0:c10:a5b:1f5]:8602,tcp://114.80.155.58:8602,@hka1;http://114.80.155.133:22016,http://[240e:96c:200:1f02:0:c10:a5b:1f5]:8601,https://yunqzhk.sseinfo.com:22019,@cf;http://114.80.155.134:22016,http://[240e:96c:200:1f02:0:c10:a5b:1f8]:22016,@tcpshplus;tcp://114.80.155.49:22017,@shplus;http://114.80.155.49:22016,@tcpsz;tcp://114.80.155.58:22017,tcp://114.80.155.134:22017,tcp://114.80.155.61:22017,@sz;http://114.80.155.58:22016,@bj;http://114.80.155.134:22016,@tcpszplus;tcp://114.80.155.48:22017,@szplus;http://114.80.155.48:22016,@kfpt;https://yunqzly.sseinfo.com:22011,@tcpshl2;tcp://114.80.155.62:22017,@shl2;http://114.80.155.62:22016,@tcphk1;tcp://[240e:96c:200:1f02:0:c10:a5b:1f5]:8602,tcp://114.80.155.133:22017,tcp://114.80.63.254:22017,@hk1;http://114.80.155.133:22016,http://[240e:96c:200:1f02:0:c10:a5b:1f5]:8601,https://yunqzhk.sseinfo.com:22019,http://114.80.63.254:22016,@nfcls;http://114.80.155.134:22013,@pb;http://114.80.155.58:22016,@tcphk10;tcp://114.80.155.133:22017,tcp://114.80.63.254:22017,@hk10;http://114.80.155.133:22016,http://114.80.63.254:22016,@tcphk5;tcp://114.80.155.133:22017,tcp://114.80.63.254:22017,@hk5;http://114.80.155.133:22016,http://114.80.63.254:22016,@tcpsh;tcp://114.80.155.58:22017,@sh;http://114.80.155.58:22016,@tcpbz;tcp://114.80.155.58:22017,tcp://114.80.155.61:22017,@bz;http://114.80.155.58:22016,@nf;http://114.80.155.57:22013,@tcpszl2;tcp://114.80.155.47:22017,@szl2;http://114.80.155.47:22016,@";
  List<String> rows = src.split("@");
  int len = rows.length;
  for (int i = 0; i < len; i++) {
    List<String> tmp = rows[i].split(";");
    if(tmp.length > 1) {
      List<String> ips = [];
      List<String> listtcp = [];
      List<String> listhttp = [];

      try {
        ips = tmp[1].split(",");
        for (String serverip in ips) {
          print("serverip="+serverip);
          if (serverip.contains("tcp")) {
            listtcp.add(serverip);
          } else if(serverip.isNotEmpty) {
            listhttp.add(serverip);
          }
        }
        print(listhttp.length);
      } catch (e) {
        print(e);
      }
    }

  }

}

void testSet() {
  Map<String, List<String>> marketSites = {};
  List<String> ips1 = ["ip1", "ip2", "ip3"];
  List<String> ips2 = ["ip1", "ip2"];

  marketSites["sh"] = ips1;
  marketSites["sz"] = ips2;

  MitakePingSet hashSet = new MitakePingSet();
  marketSites.forEach((key, value) {
    hashSet.addIps(key, value);
  });

  print(hashSet.toString());
}


void testCountUtil() {
  var counterUtil = CounterUtil(2);
  if(counterUtil.isDecrementFinished()) {
    print("isFinish=true");
  } else {
    print("isFinish=false");
  }
  var counterUtil1 = CounterUtil(2);
  var counterUtil2 = CounterUtil(2);

  print("counterUtil1.toString=${counterUtil1.getKey()}");
  print("counterUtil2.toString=${counterUtil2.getKey()}");
}

void testString() {
  String data = "{}fds}";
  int lastIndex = data.lastIndexOf("}");
  print(data.substring(0, lastIndex+1));
}

void testFuture() {
  var myFuture = Future(() {
    print("Print the future.");
    return 100;
  });
  print(myFuture);
  print("Done with main.");
}

void testClosureFunction () {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  print(add2(3));
  print(add4(3));
}

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}


void testPostBackgroundTask() {
  AppUtils.postBackgroundTask(Runnable(() {
    int count = 0, num = 1000;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    print("count=$count");
  }));

  AppUtils.post(Runnable(() {
    int count = 0, num = 100;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    print("count=$count");
  }));
}




// Future<void> testCompute() async {
//   var result = await compute(countFunc, 100);
// }
//
// // 计算偶数的个数
// Future<int> countFunc(int num) async{
//   int count = 0;
//   while (num > 0) {
//     if (num % 2 == 0) {
//       count++;
//     }
//     num--;
//   }
//   return count;
// }

void testLoopAwait() async {
  final items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  for (int item in items) {
    // doGet(item);
    await doHttpGet(item);
  }
}

Future<void> doHttpGet(int requestId) async {
  String _text = "";
  try {
    //创建一个HttpClient
    HttpClient httpClient = HttpClient();
    //打开Http连接
    HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
    //使用iPhone的UA
    request.headers.add(
      "user-agent",
      "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
    );
    //等待连接服务器（会将请求信息发送给服务器）
    HttpClientResponse response = await request.close();
    //读取响应内容
    _text = await response.transform(utf8.decoder).join();
    //输出响应头
    //print(response.headers);
    //关闭client后，通过该client发起的所有请求都会中止。
    httpClient.close();
  } catch (e) {
    _text = "请求失败：$e";
  }
  print("requestId=$requestId, response=${_text.substring(0, 10)}");
}

void testListRemove() {
  var lst1 = ["t1" , "t2" , "t3" , "t4"];
  var lst2 = ["t2" , "t4" , "t5"];

  lst1.removeWhere((item) => lst2.contains(item));
  print(lst1.toString());
}

/**
 * 获取随机码
 * @param length
 * @return
 */
String getRandomID(int length) {
  //1. 定义一个字符串（A-Z，a-z，0-9）即62个数字字母；
  String str = "zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
  //2. 由Random生成随机数
  Random random = Random();
  StringBuffer sb = StringBuffer();
  //3. 长度为几就循环几次
  for (int i = 0; i < length; ++i) {
  //从62个的数字或字母中选择
  int number = random.nextInt(62);
  //将产生的数字通过length次承载到sb中
  sb.write(str[number]);
  }
  return sb.toString();
}

testRandomList() {
  var data = [1,2,3,4,5,6,7,8,9];
  print(data..shuffle());
}

testMap() {
  var map = {"a":1, "b":2};
  // 修改value
  map.forEach((key, value) {
    // 需要重新设置才能改变值
    map[key] = key.hashCode;

    // 直接操作value不会改变Map内的值
    value = 100;
  });
  print(map.toString());

  // checkIp("testip");
  // print("testip");
  // var test = "a,b,";
  // print(test.substring(0, test.length-1));


  // RegExp exp = RegExp(r'(\w+)');
  // var str = 'Dash is a bird';
  // Iterable<Match> matches = exp.allMatches(str);
  // for (final Match m in matches) {
  //   String match = m.group(0)!;
  //   print(match);
  // }

  String code="SH1001";
  String number = code.replaceAll(RegExp("[^0-9]"), "");
  String zimu = code.replaceAll(RegExp(r"[^a-zA-Z].*$"), "");
  print("number=$number, zimu=$zimu");
}
Map<String, int> ipMap = {};
void checkIp(String ip) {
  for (; ; ) {
    print("IPCheckUtil");
    int? count = ipMap[ip];
    count ??= 0;
    if (count < 4) {
      count++;
      ipMap[ip] = count;
      return;
    }
  }
}

// Future和Timer都在Event队列执行
// Stream在MicroTask对了执行
testTimerFutureStreamMicrotask() {
  var data = [1,2,3,4,5,6,7,8,9];
  print('1');
  Future.delayed(Duration(seconds: 0), () {
    print('future.data=' + data.toString());
  });
  print('2');
  Timer.run(() {
    print('timer.data=' + data.toString());
  });
  print('3');
  // Stream执行的优先级会高于Timer
  Stream.fromIterable(data).listen((event) {
    print('stream.data=$event');
  });
  print('4');
  scheduleMicrotask(() {
    print('scheduleMicrotask1.data=$data');
  });
  scheduleMicrotask(() {
    print('scheduleMicrotask2.data=$data');
  });
  print('5');
}

testTimer() {
  Timer.periodic(const Duration(seconds: 3), (timer) {
    print(DateTime.now().second);
  });
}

testSubString() {
  String eventStr = 'app_key=72ef6149f8ae0d421c8973f71313e049af908074&timestamp=1652085654038&hour=16&dow=1&user_details=%7B%22custom%22%3A%7B%22date%22%3A%2220220509%22%2C%22carrier%22%3A%22%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8%22%2C%22device_model%22%3A%22VOG-AL10%22%2C%22os%22%3A%22Android%22%2C%22density%22%3A%22XXHDPI%22%2C%22os_version%22%3A%2210%22%2C%22fc_device_id%22%3A%22YWzhvk0XWcUDAHUe79zRLZCB%22%2C%22session_id%22%3A%22YWzhvk0XWcUDAHUe79zRLZCB-1652085654029%22%2C%22resolution%22%3A%221080x2265%22%2C%22mac%22%3A%2202%3A00%3A00%3A00%3A00%3A00%22%7D%7D&device_id=07ce338bab754d3a&checksum=5D40521D2A0F9BB6E93A0557A03BEC245F8C1C9E';
  int start = eventStr.indexOf("&device_id=", 0);
  int len = "&device_id=".length;
  print('start=$start, len=$len');
  String deviceId = eventStr.substring(start + len);
  print('deviceId=$deviceId');
}

testStreamProducerConsumer() {
  List<String> spData = []; // 模拟保存到SharedPreference

  StreamController<String> streamController = StreamController();

  // 模拟每1秒生产一份数据
  Timer.periodic(Duration(seconds: 1), (timer) async {
    String event = generateRandomString();
    // 模拟保存到SharedPreference
    await Future.delayed(Duration(milliseconds: 100));
    spData.add(event);
    // 生产event数据，加到stream流里
    streamController.sink.add(event);
    print('>>>Producer每秒生成一份数据添加到队列: ' + spData.toString());
  });

  // 模拟消费events数据，2秒消费一次数据
  streamController.stream.listen((event) async {
    // 模拟网络请求耗时2秒，然后从spData里删除次调数据
    // Future.delayed(Duration(seconds: 2));
    print('<<<Consumer开始消费数据：$event');
    await Future.delayed(Duration(seconds: 2));
    spData.remove(event);
    print('<<<Consumer消费后的队列数据: ${spData.toString()}');
    print('==========================\n');
  });

}

String generateRandomString() {
  final _random = Random();
  const _availableChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final randomString = List.generate(_random.nextInt(_availableChars.length) + 1,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();
  return randomString;
}

// 通过StreamController构建和监听Stream
testStreamController() {
  // 创建Stream
  StreamController<String> controller = StreamController<String>();
  // 向Stream中添加数据
  controller.sink.add("event1");
  controller.sink.add("event2");
  controller.sink.add("event3");
  controller.sink.addError("somethine wrong here!");
  controller.close();
  // 创建Stream监听器
  controller.stream.listen(
      (event) => print(event) ,
      onError: (err) => print(err),
      onDone: () => print('Mission complete!'));
}

testStreamFromIterable() {
  var data = [1,2,3,4,5,6,7,8,9];

  var stream = Stream.fromIterable(data)
      .where((event) => event % 2 == 0)
      .take(2)
      .takeWhile((element) => element < 3)
      .map((event) => event * 3);

  stream.listen((event) {
    print(event);
    print('do something!');
  });
}

testStreamFromFuture() {
  Stream<String> stream = Stream.fromFuture(getData());
  stream.listen((event) {
    print(event);
  }, onDone: () {
    print('stream close!');
  }, onError: (err) {
    print(err);
  });
}

Future<String> getData() async {
  print('正在获取网络数据...');
  // 模拟网络延时3秒后返回数据
  await Future.delayed(Duration(seconds: 3));
  print('获取网络数据成功！');
  return 'get data success!';
}

testStreamFromPeriodic() {
  var stream = Stream<int>.periodic(Duration(seconds: 1), (count) => count * count)
      .take(5);
  stream.forEach((element) {print(element);});
}

testIsolateWorker() {
  var worker = Worker();
  worker.request('发送消息1').then((data) {
    print('子线程处理后的消息:$data');
  });

  Future.delayed(Duration(seconds: 2), () {
    worker.request('发送消息2').then((data) {
      print('子线程处理后的消息:$data');
    });
  });
}

Isolate? thread;

testIsolate() async {
  //创建主线程接收端口，用来接收子线程消息
  ReceivePort mainThreadReceivePort = ReceivePort();
  late SendPort childThreadSendPort;
  //监听子线程消息
  mainThreadReceivePort.listen((data) {
    print('主线程收到来自子线程的消息：$data');
    if (data is SendPort) {
      childThreadSendPort = data;
    }
  });

  // 开启子线程，创建并发Isolate，并传入主线程发送端口
  var params = {"store": 1, "deviceId": 2, 'sendPort': mainThreadReceivePort.sendPort};
  await startThread(params);

  // 向子线程发消息
  await Future.delayed(Duration(seconds: 1), () {
    childThreadSendPort.send('我来自主线程');
  });

  // 向子线程发消息
  await Future.delayed(Duration(seconds: 1), () {
    childThreadSendPort.send('end');
  });
}

startThread(Map<String, dynamic> params) async {
  thread = await Isolate.spawn(run, params);
}

run(Map<String, dynamic> message) {
  ReceivePort threadReceivePort = ReceivePort();
  SendPort mainSendPort = message['sendPort'];
  print('==entryPoint==$message');
  print('子线程开启');
  mainSendPort.send(threadReceivePort.sendPort);
  threadReceivePort.listen((message) {
    print('子线程收到来自主线的消息：$message');
    assert(message is String);
    if (message == 'end') {
      thread?.kill();
      print('子线程结束');
      return;
    }
  });
  return;
}

void testUri() {
  var str = "http:xxx.com/?a=1&b=2&c=3";
  var uri = Uri.parse(str);
  uri.queryParameters.forEach((key, value) {
    print("key=$key, value=$value");
  });
}

void testForEachReturn() {
  bool flag = false;
  Map<String, int> example = {'A': 1, 'B': 2, 'C': 3};
  example.forEach((key, value) {
    if (value == 2) {
      print('value=$value');
      flag = true;
      return;
    }
  });
  print('flag=$flag');
  print("example.length=${example.length}");
}

// 创建一个新的 isolate
create_isolate() async {
  ReceivePort rp = new ReceivePort();
  SendPort port1 = rp.sendPort;

  Isolate newIsolate = await Isolate.spawn(doWork, port1);

  SendPort port2;
  rp.listen((message) {
    print("main isolate message: $message");
    // if (message[0] == 0) {
    //   port2 = message[1];
    // } else {
    //   port2.send([1, "这条信息是 main isolate 发送的"]);
    // }
  });
}

// 处理耗时任务
void doWork(SendPort port1) {
  print("new isolate start");
  ReceivePort rp2 = new ReceivePort();
  SendPort port2 = rp2.sendPort;

  rp2.listen((message) {
    print("doWork message: $message");
  });

// 将新isolate中创建的SendPort发送到主isolate中用于通信
  port1.send([0, port2]);
// 模拟耗时5秒
  sleep(Duration(seconds: 5));
  port1.send([1, "doWork 任务完成"]);

  print("new isolate end");
}
