class SiteFilterBean {
  String ip = "";
  Set<String> market = <String>{};

  SiteFilterBean(String market, this.ip) {
    this.market.add(market);
  }

  @override
  bool operator ==(Object o) {
    if (ip.isEmpty || market.isEmpty) {
      return true;
    }
    SiteFilterBean test = o as SiteFilterBean;
    if (ip.trim() == test.ip.trim()) {
      test.getMarket().addAll(market);
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return 'SiteFilterBean{ip: $ip, market: $market}';
  }

  @override
  int get hashCode {
    if (ip.isEmpty || market.isEmpty) {
      return -1;
    }
    int result = ip.hashCode;
    return result;
  }

  Set<String> getMarket() {
    return market;
  }

  String getIp() {
    return ip;
  }
}