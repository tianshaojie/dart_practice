abstract class IInfoLevelListener {
  void onChanged(String text);

}
abstract class LevelAndIpChangedListener extends IInfoLevelListener {
  void ipChanged(String ip);
}


class TestListener {
  //用来监听个市场站点变化
  static IInfoLevelListener? mInfoLevelListener;

  void setInfoLevelListener(IInfoLevelListener infoLevelListener) {
    mInfoLevelListener = infoLevelListener;
  }

  void testCallListener() {
    if(mInfoLevelListener != null) {
      mInfoLevelListener!.onChanged("text");
    }
  }
}


abstract class Event {
  void run();
}

class _AnonymousEvent implements Event {
  _AnonymousEvent({required void run()}): _run = run;

  final void Function() _run;

  @override
  void run() => _run();
}

Event createAnonymousEvent() {
  return _AnonymousEvent(
    run: () => print('run'),
  );
}



Future<void> main() async {

}