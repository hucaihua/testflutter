import 'package:testflutter/generated/json/base/json_convert_content.dart';
import 'package:testflutter/model/http_bin_entity.dart';

HttpBinEntity $HttpBinEntityFromJson(Map<String, dynamic> json) {
	final HttpBinEntity httpBinEntity = HttpBinEntity();
	final Map<String,dynamic>? args = jsonConvert.convert<Map<String,dynamic>>(json['args']);
	if (args != null) {
		httpBinEntity.args = args;
	}
	final HttpBinHeaders? headers = jsonConvert.convert<HttpBinHeaders>(json['headers']);
	if (headers != null) {
		httpBinEntity.headers = headers;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		httpBinEntity.origin = origin;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		httpBinEntity.url = url;
	}
	return httpBinEntity;
}

Map<String, dynamic> $HttpBinEntityToJson(HttpBinEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['args'] = entity.args;
	data['headers'] = entity.headers?.toJson();
	data['origin'] = entity.origin;
	data['url'] = entity.url;
	return data;
}

HttpBinHeaders $HttpBinHeadersFromJson(Map<String, dynamic> json) {
	final HttpBinHeaders httpBinHeaders = HttpBinHeaders();
	final String? accept = jsonConvert.convert<String>(json['Accept']);
	if (accept != null) {
		httpBinHeaders.accept = accept;
	}
	final String? acceptEncoding = jsonConvert.convert<String>(json['Accept-Encoding']);
	if (acceptEncoding != null) {
		httpBinHeaders.acceptEncoding = acceptEncoding;
	}
	final String? acceptLanguage = jsonConvert.convert<String>(json['Accept-Language']);
	if (acceptLanguage != null) {
		httpBinHeaders.acceptLanguage = acceptLanguage;
	}
	final String? host = jsonConvert.convert<String>(json['Host']);
	if (host != null) {
		httpBinHeaders.host = host;
	}
	final String? secChUa = jsonConvert.convert<String>(json['Sec-Ch-Ua']);
	if (secChUa != null) {
		httpBinHeaders.secChUa = secChUa;
	}
	final String? secChUaMobile = jsonConvert.convert<String>(json['Sec-Ch-Ua-Mobile']);
	if (secChUaMobile != null) {
		httpBinHeaders.secChUaMobile = secChUaMobile;
	}
	final String? secChUaPlatform = jsonConvert.convert<String>(json['Sec-Ch-Ua-Platform']);
	if (secChUaPlatform != null) {
		httpBinHeaders.secChUaPlatform = secChUaPlatform;
	}
	final String? secFetchDest = jsonConvert.convert<String>(json['Sec-Fetch-Dest']);
	if (secFetchDest != null) {
		httpBinHeaders.secFetchDest = secFetchDest;
	}
	final String? secFetchMode = jsonConvert.convert<String>(json['Sec-Fetch-Mode']);
	if (secFetchMode != null) {
		httpBinHeaders.secFetchMode = secFetchMode;
	}
	final String? secFetchSite = jsonConvert.convert<String>(json['Sec-Fetch-Site']);
	if (secFetchSite != null) {
		httpBinHeaders.secFetchSite = secFetchSite;
	}
	final String? secFetchUser = jsonConvert.convert<String>(json['Sec-Fetch-User']);
	if (secFetchUser != null) {
		httpBinHeaders.secFetchUser = secFetchUser;
	}
	final String? upgradeInsecureRequests = jsonConvert.convert<String>(json['Upgrade-Insecure-Requests']);
	if (upgradeInsecureRequests != null) {
		httpBinHeaders.upgradeInsecureRequests = upgradeInsecureRequests;
	}
	final String? userAgent = jsonConvert.convert<String>(json['User-Agent']);
	if (userAgent != null) {
		httpBinHeaders.userAgent = userAgent;
	}
	final String? xAmznTraceId = jsonConvert.convert<String>(json['X-Amzn-Trace-Id']);
	if (xAmznTraceId != null) {
		httpBinHeaders.xAmznTraceId = xAmznTraceId;
	}
	return httpBinHeaders;
}

Map<String, dynamic> $HttpBinHeadersToJson(HttpBinHeaders entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['Accept'] = entity.accept;
	data['Accept-Encoding'] = entity.acceptEncoding;
	data['Accept-Language'] = entity.acceptLanguage;
	data['Host'] = entity.host;
	data['Sec-Ch-Ua'] = entity.secChUa;
	data['Sec-Ch-Ua-Mobile'] = entity.secChUaMobile;
	data['Sec-Ch-Ua-Platform'] = entity.secChUaPlatform;
	data['Sec-Fetch-Dest'] = entity.secFetchDest;
	data['Sec-Fetch-Mode'] = entity.secFetchMode;
	data['Sec-Fetch-Site'] = entity.secFetchSite;
	data['Sec-Fetch-User'] = entity.secFetchUser;
	data['Upgrade-Insecure-Requests'] = entity.upgradeInsecureRequests;
	data['User-Agent'] = entity.userAgent;
	data['X-Amzn-Trace-Id'] = entity.xAmznTraceId;
	return data;
}