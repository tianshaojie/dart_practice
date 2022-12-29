import 'SiteFilterBean.dart';


class MitakePingSet {
  /**
   * 需求pingIp的所有的市场
   */
  Map<String, dynamic> marketMap = {};
  Set<SiteFilterBean> siteFilterSet = {};

  bool add(String market, String ip) {
    if (ip == null || ip.length == 0) {
      return false;
    }
    SiteFilterBean object = SiteFilterBean(market, ip);
    return siteFilterSet.add(object);
  }

  bool addIps(String market, List<String> ips) {
    if (ips == null || ips.length == 0) {
      return false;
    }
    marketMap[market] = market;
    for (String ip in ips) {
      SiteFilterBean object = SiteFilterBean(market, ip);
      siteFilterSet.add(object);
    }
    return true;
  }

  Map<String, dynamic>? getMarketMap() {
    return marketMap;
  }

  bool isEmpty() {
    return siteFilterSet.isEmpty;
  }

  int size() {
    return siteFilterSet.length;
  }

  @override
  String toString() {
    return 'MitakePingSet{marketMap: $marketMap, siteFilterSet: $siteFilterSet}';
  }
}