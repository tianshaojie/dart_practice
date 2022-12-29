import 'dart:async';

class AppUtils {


  /**
   * 微任务队列(MicroTask Queue)，
   * 内部设计为非常短暂操作，执行优先级高于事件队列(Event Queue)
   * 这些任务「需要在其他内部微任务执行完之后且在把事件移交给事件队列之前」立即异步执行
   *
   * @param runnable
   */
  static void post(Runnable runnable) {
    scheduleMicrotask(() {
      runnable.run();
    });
  }


  /**
   * 事件队列(Event Queue)
   * 有可能的还是尽量使用Future来向Event队列添加事件。
   * 使用Event队列可以保持MicroTask队列的简短，以此减少MicroTask的过度使用导致event队列的堵塞。
   * @param runnable
   */
  static Future<void> postBackgroundTask(Runnable runnable) async {
    await Future(() {
      runnable.run();
    });
  }

}

class Runnable {
  Function run;
  Runnable(this.run);
}