class CounterUtil {
  final String TAG = "CounterUtil";
  int mAtomicInteger = 0;
  int mCount = 0;
  int mRequestNum = 0;

  int addNum() {

    return mRequestNum++;
  }
  String getKey() {
    return "$TAG@$hashCode";
  }

  /**
   * 用于递减
   *
   * @param count
   */
  CounterUtil(int count) {
    mCount = count;
    mAtomicInteger = count;
  }

  /**
   * 用于递减
   *
   * @param count
   */
  void setCount(int count) {
    mCount = count;
    mAtomicInteger = count;
  }

  /**
   * 递减时设置的最大值
   *
   * @return
   */
  int getmCount() {
    return mCount;
  }

  /**
   * 是否增加到times,第一次增加到times时为true
   *
   * @param times
   * @return
   */
  bool isIncrementFinished(int times) {
    if (mAtomicInteger == times) {
      return false;
    }
    return ++mAtomicInteger == times;
  }

  int get() {
    return mAtomicInteger;
  }

  /**
   * 是否由mcount递减到0,第一次递减到0时为true
   *
   * @return
   */
  bool isDecrementFinished() {
    if (mAtomicInteger == 0) {
      return false;
    }
    return --mAtomicInteger == 0;
  }
  /**
   * 递减，计数
   */
  void decrement() {
    --mAtomicInteger;
  }
  /**
   * 递增，计数
   */
  void increment() {
    ++mAtomicInteger;
  }

  /**
   * 判断是否为0
   */
  bool isFinishedZero() {
    return mAtomicInteger == 0;
  }
}