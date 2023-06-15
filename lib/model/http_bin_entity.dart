import 'dart:convert';

import 'package:testflutter/generated/json/base/json_field.dart';
import 'package:testflutter/generated/json/http_bin_entity.g.dart';

/// 注意转义符解析会报错 .需要提前将json中的\替换为\\
/// """
//     {
//   "args": {
//     "name": "caihua"
//   },
//   "headers": {
//     "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
//     "Accept-Encoding": "gzip, deflate, br",
//     "Accept-Language": "zh-CN,zh;q=0.9",
//     "Host": "httpbin.org",
//     "Sec-Ch-Ua": "\\"Not.A/Brand\\";v=\\"8\\", \\"Chromium\\";v=\\"114\\", \\"Google Chrome\\";v=\\"114\\"",
//     "Sec-Ch-Ua-Mobile": "?0",
//     "Sec-Ch-Ua-Platform": "\\"macOS\\"",
//     "Sec-Fetch-Dest": "document",
//     "Sec-Fetch-Mode": "navigate",
//     "Sec-Fetch-Site": "none",
//     "Sec-Fetch-User": "?1",
//     "Upgrade-Insecure-Requests": "1",
//     "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
//     "X-Amzn-Trace-Id": "Root=1-648968a3-04033ffa794120bc0401d074"
//   },
//   "origin": "34.216.166.165",
//   "url": "https://httpbin.org/get?name=caihua"
// }
//     """
@JsonSerializable()
class HttpBinEntity {
  String? args;
  HttpBinHeaders? headers;
  String? origin = '';
  String? url = '';
  String? data;

  HttpBinEntity();

  factory HttpBinEntity.fromJson(Map<String, dynamic> json) => $HttpBinEntityFromJson(json);

  Map<String, dynamic> toJson() => $HttpBinEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HttpBinHeaders {
	@JSONField(name: "Accept")
	String? accept = '';
	@JSONField(name: "Accept-Encoding")
	String? acceptEncoding = '';
	@JSONField(name: "Accept-Language")
	String? acceptLanguage = '';
	@JSONField(name: "Host")
	String? host = '';
	@JSONField(name: "Sec-Ch-Ua")
	String? secChUa = '';
	@JSONField(name: "Sec-Ch-Ua-Mobile")
	String? secChUaMobile = '';
	@JSONField(name: "Sec-Ch-Ua-Platform")
	String? secChUaPlatform = '';
	@JSONField(name: "Sec-Fetch-Dest")
	String? secFetchDest = '';
	@JSONField(name: "Sec-Fetch-Mode")
	String? secFetchMode = '';
	@JSONField(name: "Sec-Fetch-Site")
	String? secFetchSite = '';
	@JSONField(name: "Sec-Fetch-User")
	String? secFetchUser = '';
	@JSONField(name: "Upgrade-Insecure-Requests")
	String? upgradeInsecureRequests = '';
	@JSONField(name: "User-Agent")
	String? userAgent = '';
	@JSONField(name: "X-Amzn-Trace-Id")
	String? xAmznTraceId = '';

	HttpBinHeaders();

	factory HttpBinHeaders.fromJson(Map<String, dynamic> json) => $HttpBinHeadersFromJson(json);

	Map<String, dynamic> toJson() => $HttpBinHeadersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}