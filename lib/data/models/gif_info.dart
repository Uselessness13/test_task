// To parse this JSON data, do
//
//     final gifInfo = gifInfoFromJson(jsonString);

import 'dart:convert';

class GifInfo {
  GifInfo({
    this.innerId,
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.tags,
    this.featuredTags,
    this.userTags,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.analyticsResponsePayload,
    this.analytics,
  });

  int innerId;
  String type;
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String rating;
  String contentUrl;
  List<dynamic> tags;
  List<dynamic> featuredTags;
  List<dynamic> userTags;
  String sourceTld;
  String sourcePostUrl;
  int isSticker;
  DateTime importDatetime;
  DateTime trendingDatetime;
  Images images;
  String analyticsResponsePayload;
  Analytics analytics;

  GifInfo copyWith({
    int innerId,
    String type,
    String id,
    String url,
    String slug,
    String bitlyGifUrl,
    String bitlyUrl,
    String embedUrl,
    String username,
    String source,
    String title,
    String rating,
    String contentUrl,
    List<dynamic> tags,
    List<dynamic> featuredTags,
    List<dynamic> userTags,
    String sourceTld,
    String sourcePostUrl,
    int isSticker,
    DateTime importDatetime,
    DateTime trendingDatetime,
    Images images,
    String analyticsResponsePayload,
    Analytics analytics,
  }) =>
      GifInfo(
        innerId: innerId,
        type: type ?? this.type,
        id: id ?? this.id,
        url: url ?? this.url,
        slug: slug ?? this.slug,
        bitlyGifUrl: bitlyGifUrl ?? this.bitlyGifUrl,
        bitlyUrl: bitlyUrl ?? this.bitlyUrl,
        embedUrl: embedUrl ?? this.embedUrl,
        username: username ?? this.username,
        source: source ?? this.source,
        title: title ?? this.title,
        rating: rating ?? this.rating,
        contentUrl: contentUrl ?? this.contentUrl,
        tags: tags ?? this.tags,
        featuredTags: featuredTags ?? this.featuredTags,
        userTags: userTags ?? this.userTags,
        sourceTld: sourceTld ?? this.sourceTld,
        sourcePostUrl: sourcePostUrl ?? this.sourcePostUrl,
        isSticker: isSticker ?? this.isSticker,
        importDatetime: importDatetime ?? this.importDatetime,
        trendingDatetime: trendingDatetime ?? this.trendingDatetime,
        images: images ?? this.images,
        analyticsResponsePayload:
            analyticsResponsePayload ?? this.analyticsResponsePayload,
        analytics: analytics ?? this.analytics,
      );

  factory GifInfo.fromRawJson(String str) => GifInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GifInfo.fromJson(Map<String, dynamic> json) => GifInfo(
        innerId: json["inner_id"] == null ? null : json["inner_id"],
        type: json["type"] == null ? null : json["type"],
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        slug: json["slug"] == null ? null : json["slug"],
        bitlyGifUrl:
            json["bitly_gif_url"] == null ? null : json["bitly_gif_url"],
        bitlyUrl: json["bitly_url"] == null ? null : json["bitly_url"],
        embedUrl: json["embed_url"] == null ? null : json["embed_url"],
        username: json["username"] == null ? null : json["username"],
        source: json["source"] == null ? null : json["source"],
        title: json["title"] == null ? null : json["title"],
        rating: json["rating"] == null ? null : json["rating"],
        contentUrl: json["content_url"] == null ? null : json["content_url"],
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        featuredTags: json["featured_tags"] == null
            ? null
            : List<dynamic>.from(json["featured_tags"].map((x) => x)),
        userTags: json["user_tags"] == null
            ? null
            : List<dynamic>.from(json["user_tags"].map((x) => x)),
        sourceTld: json["source_tld"] == null ? null : json["source_tld"],
        sourcePostUrl:
            json["source_post_url"] == null ? null : json["source_post_url"],
        isSticker: json["is_sticker"] == null ? null : json["is_sticker"],
        importDatetime: json["import_datetime"] == null
            ? null
            : DateTime.parse(json["import_datetime"]),
        trendingDatetime: json["trending_datetime"] == null
            ? null
            : DateTime.parse(json["trending_datetime"]),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        analyticsResponsePayload: json["analytics_response_payload"] == null
            ? null
            : json["analytics_response_payload"],
        analytics: json["analytics"] == null
            ? null
            : Analytics.fromJson(json["analytics"]),
      );
  Map<String, dynamic> toMap() => {
        "inner_id": innerId == null ? null : innerId,
        "url": images.original.url,
      };
  Map<String, dynamic> toJson() => {
        "inner_id": innerId == null ? null : innerId,
        "type": type == null ? null : type,
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "slug": slug == null ? null : slug,
        "bitly_gif_url": bitlyGifUrl == null ? null : bitlyGifUrl,
        "bitly_url": bitlyUrl == null ? null : bitlyUrl,
        "embed_url": embedUrl == null ? null : embedUrl,
        "username": username == null ? null : username,
        "source": source == null ? null : source,
        "title": title == null ? null : title,
        "rating": rating == null ? null : rating,
        "content_url": contentUrl == null ? null : contentUrl,
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "featured_tags": featuredTags == null
            ? null
            : List<dynamic>.from(featuredTags.map((x) => x)),
        "user_tags": userTags == null
            ? null
            : List<dynamic>.from(userTags.map((x) => x)),
        "source_tld": sourceTld == null ? null : sourceTld,
        "source_post_url": sourcePostUrl == null ? null : sourcePostUrl,
        "is_sticker": isSticker == null ? null : isSticker,
        "import_datetime":
            importDatetime == null ? null : importDatetime.toIso8601String(),
        "trending_datetime": trendingDatetime == null
            ? null
            : trendingDatetime.toIso8601String(),
        "images": images == null ? null : images.toJson(),
        "analytics_response_payload":
            analyticsResponsePayload == null ? null : analyticsResponsePayload,
        "analytics": analytics == null ? null : analytics.toJson(),
      };
}

class Analytics {
  Analytics({
    this.onload,
    this.onclick,
    this.onsent,
  });

  Onclick onload;
  Onclick onclick;
  Onclick onsent;

  Analytics copyWith({
    Onclick onload,
    Onclick onclick,
    Onclick onsent,
  }) =>
      Analytics(
        onload: onload ?? this.onload,
        onclick: onclick ?? this.onclick,
        onsent: onsent ?? this.onsent,
      );

  factory Analytics.fromRawJson(String str) =>
      Analytics.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
        onload:
            json["onload"] == null ? null : Onclick.fromJson(json["onload"]),
        onclick:
            json["onclick"] == null ? null : Onclick.fromJson(json["onclick"]),
        onsent:
            json["onsent"] == null ? null : Onclick.fromJson(json["onsent"]),
      );

  Map<String, dynamic> toJson() => {
        "onload": onload == null ? null : onload.toJson(),
        "onclick": onclick == null ? null : onclick.toJson(),
        "onsent": onsent == null ? null : onsent.toJson(),
      };
}

class Onclick {
  Onclick({
    this.url,
  });

  String url;

  Onclick copyWith({
    String url,
  }) =>
      Onclick(
        url: url ?? this.url,
      );

  factory Onclick.fromRawJson(String str) => Onclick.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
      };
}

class Images {
  Images({
    this.original,
    this.downsized,
    this.downsizedLarge,
    this.downsizedMedium,
    this.downsizedSmall,
    this.downsizedStill,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedHeightSmallStill,
    this.fixedHeightStill,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
    this.fixedWidthSmallStill,
    this.fixedWidthStill,
    this.looping,
    this.originalStill,
    this.originalMp4,
    this.preview,
    this.previewGif,
    this.previewWebp,
    this.the480WStill,
  });

  FixedHeight original;
  The480WStill downsized;
  The480WStill downsizedLarge;
  The480WStill downsizedMedium;
  DownsizedSmall downsizedSmall;
  The480WStill downsizedStill;
  FixedHeight fixedHeight;
  FixedHeight fixedHeightDownsampled;
  FixedHeight fixedHeightSmall;
  The480WStill fixedHeightSmallStill;
  The480WStill fixedHeightStill;
  FixedHeight fixedWidth;
  FixedHeight fixedWidthDownsampled;
  FixedHeight fixedWidthSmall;
  The480WStill fixedWidthSmallStill;
  The480WStill fixedWidthStill;
  Looping looping;
  The480WStill originalStill;
  DownsizedSmall originalMp4;
  DownsizedSmall preview;
  The480WStill previewGif;
  The480WStill previewWebp;
  The480WStill the480WStill;

  Images copyWith({
    FixedHeight original,
    The480WStill downsized,
    The480WStill downsizedLarge,
    The480WStill downsizedMedium,
    DownsizedSmall downsizedSmall,
    The480WStill downsizedStill,
    FixedHeight fixedHeight,
    FixedHeight fixedHeightDownsampled,
    FixedHeight fixedHeightSmall,
    The480WStill fixedHeightSmallStill,
    The480WStill fixedHeightStill,
    FixedHeight fixedWidth,
    FixedHeight fixedWidthDownsampled,
    FixedHeight fixedWidthSmall,
    The480WStill fixedWidthSmallStill,
    The480WStill fixedWidthStill,
    Looping looping,
    The480WStill originalStill,
    DownsizedSmall originalMp4,
    DownsizedSmall preview,
    The480WStill previewGif,
    The480WStill previewWebp,
    The480WStill the480WStill,
  }) =>
      Images(
        original: original ?? this.original,
        downsized: downsized ?? this.downsized,
        downsizedLarge: downsizedLarge ?? this.downsizedLarge,
        downsizedMedium: downsizedMedium ?? this.downsizedMedium,
        downsizedSmall: downsizedSmall ?? this.downsizedSmall,
        downsizedStill: downsizedStill ?? this.downsizedStill,
        fixedHeight: fixedHeight ?? this.fixedHeight,
        fixedHeightDownsampled:
            fixedHeightDownsampled ?? this.fixedHeightDownsampled,
        fixedHeightSmall: fixedHeightSmall ?? this.fixedHeightSmall,
        fixedHeightSmallStill:
            fixedHeightSmallStill ?? this.fixedHeightSmallStill,
        fixedHeightStill: fixedHeightStill ?? this.fixedHeightStill,
        fixedWidth: fixedWidth ?? this.fixedWidth,
        fixedWidthDownsampled:
            fixedWidthDownsampled ?? this.fixedWidthDownsampled,
        fixedWidthSmall: fixedWidthSmall ?? this.fixedWidthSmall,
        fixedWidthSmallStill: fixedWidthSmallStill ?? this.fixedWidthSmallStill,
        fixedWidthStill: fixedWidthStill ?? this.fixedWidthStill,
        looping: looping ?? this.looping,
        originalStill: originalStill ?? this.originalStill,
        originalMp4: originalMp4 ?? this.originalMp4,
        preview: preview ?? this.preview,
        previewGif: previewGif ?? this.previewGif,
        previewWebp: previewWebp ?? this.previewWebp,
        the480WStill: the480WStill ?? this.the480WStill,
      );

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: json["original"] == null
            ? null
            : FixedHeight.fromJson(json["original"]),
        downsized: json["downsized"] == null
            ? null
            : The480WStill.fromJson(json["downsized"]),
        downsizedLarge: json["downsized_large"] == null
            ? null
            : The480WStill.fromJson(json["downsized_large"]),
        downsizedMedium: json["downsized_medium"] == null
            ? null
            : The480WStill.fromJson(json["downsized_medium"]),
        downsizedSmall: json["downsized_small"] == null
            ? null
            : DownsizedSmall.fromJson(json["downsized_small"]),
        downsizedStill: json["downsized_still"] == null
            ? null
            : The480WStill.fromJson(json["downsized_still"]),
        fixedHeight: json["fixed_height"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_height"]),
        fixedHeightDownsampled: json["fixed_height_downsampled"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_height_downsampled"]),
        fixedHeightSmall: json["fixed_height_small"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_height_small"]),
        fixedHeightSmallStill: json["fixed_height_small_still"] == null
            ? null
            : The480WStill.fromJson(json["fixed_height_small_still"]),
        fixedHeightStill: json["fixed_height_still"] == null
            ? null
            : The480WStill.fromJson(json["fixed_height_still"]),
        fixedWidth: json["fixed_width"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_width"]),
        fixedWidthDownsampled: json["fixed_width_downsampled"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_width_downsampled"]),
        fixedWidthSmall: json["fixed_width_small"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_width_small"]),
        fixedWidthSmallStill: json["fixed_width_small_still"] == null
            ? null
            : The480WStill.fromJson(json["fixed_width_small_still"]),
        fixedWidthStill: json["fixed_width_still"] == null
            ? null
            : The480WStill.fromJson(json["fixed_width_still"]),
        looping:
            json["looping"] == null ? null : Looping.fromJson(json["looping"]),
        originalStill: json["original_still"] == null
            ? null
            : The480WStill.fromJson(json["original_still"]),
        originalMp4: json["original_mp4"] == null
            ? null
            : DownsizedSmall.fromJson(json["original_mp4"]),
        preview: json["preview"] == null
            ? null
            : DownsizedSmall.fromJson(json["preview"]),
        previewGif: json["preview_gif"] == null
            ? null
            : The480WStill.fromJson(json["preview_gif"]),
        previewWebp: json["preview_webp"] == null
            ? null
            : The480WStill.fromJson(json["preview_webp"]),
        the480WStill: json["480w_still"] == null
            ? null
            : The480WStill.fromJson(json["480w_still"]),
      );

  Map<String, dynamic> toJson() => {
        "original": original == null ? null : original.toJson(),
        "downsized": downsized == null ? null : downsized.toJson(),
        "downsized_large":
            downsizedLarge == null ? null : downsizedLarge.toJson(),
        "downsized_medium":
            downsizedMedium == null ? null : downsizedMedium.toJson(),
        "downsized_small":
            downsizedSmall == null ? null : downsizedSmall.toJson(),
        "downsized_still":
            downsizedStill == null ? null : downsizedStill.toJson(),
        "fixed_height": fixedHeight == null ? null : fixedHeight.toJson(),
        "fixed_height_downsampled": fixedHeightDownsampled == null
            ? null
            : fixedHeightDownsampled.toJson(),
        "fixed_height_small":
            fixedHeightSmall == null ? null : fixedHeightSmall.toJson(),
        "fixed_height_small_still": fixedHeightSmallStill == null
            ? null
            : fixedHeightSmallStill.toJson(),
        "fixed_height_still":
            fixedHeightStill == null ? null : fixedHeightStill.toJson(),
        "fixed_width": fixedWidth == null ? null : fixedWidth.toJson(),
        "fixed_width_downsampled": fixedWidthDownsampled == null
            ? null
            : fixedWidthDownsampled.toJson(),
        "fixed_width_small":
            fixedWidthSmall == null ? null : fixedWidthSmall.toJson(),
        "fixed_width_small_still":
            fixedWidthSmallStill == null ? null : fixedWidthSmallStill.toJson(),
        "fixed_width_still":
            fixedWidthStill == null ? null : fixedWidthStill.toJson(),
        "looping": looping == null ? null : looping.toJson(),
        "original_still": originalStill == null ? null : originalStill.toJson(),
        "original_mp4": originalMp4 == null ? null : originalMp4.toJson(),
        "preview": preview == null ? null : preview.toJson(),
        "preview_gif": previewGif == null ? null : previewGif.toJson(),
        "preview_webp": previewWebp == null ? null : previewWebp.toJson(),
        "480w_still": the480WStill == null ? null : the480WStill.toJson(),
      };
}

class The480WStill {
  The480WStill({
    this.height,
    this.width,
    this.size,
    this.url,
  });

  String height;
  String width;
  String size;
  String url;

  The480WStill copyWith({
    String height,
    String width,
    String size,
    String url,
  }) =>
      The480WStill(
        height: height ?? this.height,
        width: width ?? this.width,
        size: size ?? this.size,
        url: url ?? this.url,
      );

  factory The480WStill.fromRawJson(String str) =>
      The480WStill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The480WStill.fromJson(Map<String, dynamic> json) => The480WStill(
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
        size: json["size"] == null ? null : json["size"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "width": width == null ? null : width,
        "size": size == null ? null : size,
        "url": url == null ? null : url,
      };
}

class DownsizedSmall {
  DownsizedSmall({
    this.height,
    this.width,
    this.mp4Size,
    this.mp4,
  });

  String height;
  String width;
  String mp4Size;
  String mp4;

  DownsizedSmall copyWith({
    String height,
    String width,
    String mp4Size,
    String mp4,
  }) =>
      DownsizedSmall(
        height: height ?? this.height,
        width: width ?? this.width,
        mp4Size: mp4Size ?? this.mp4Size,
        mp4: mp4 ?? this.mp4,
      );

  factory DownsizedSmall.fromRawJson(String str) =>
      DownsizedSmall.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DownsizedSmall.fromJson(Map<String, dynamic> json) => DownsizedSmall(
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
        mp4Size: json["mp4_size"] == null ? null : json["mp4_size"],
        mp4: json["mp4"] == null ? null : json["mp4"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "width": width == null ? null : width,
        "mp4_size": mp4Size == null ? null : mp4Size,
        "mp4": mp4 == null ? null : mp4,
      };
}

class FixedHeight {
  FixedHeight({
    this.height,
    this.width,
    this.size,
    this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;
  String frames;
  String hash;

  FixedHeight copyWith({
    String height,
    String width,
    String size,
    String url,
    String mp4Size,
    String mp4,
    String webpSize,
    String webp,
    String frames,
    String hash,
  }) =>
      FixedHeight(
        height: height ?? this.height,
        width: width ?? this.width,
        size: size ?? this.size,
        url: url ?? this.url,
        mp4Size: mp4Size ?? this.mp4Size,
        mp4: mp4 ?? this.mp4,
        webpSize: webpSize ?? this.webpSize,
        webp: webp ?? this.webp,
        frames: frames ?? this.frames,
        hash: hash ?? this.hash,
      );

  factory FixedHeight.fromRawJson(String str) =>
      FixedHeight.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
        size: json["size"] == null ? null : json["size"],
        url: json["url"] == null ? null : json["url"],
        mp4Size: json["mp4_size"] == null ? null : json["mp4_size"],
        mp4: json["mp4"] == null ? null : json["mp4"],
        webpSize: json["webp_size"] == null ? null : json["webp_size"],
        webp: json["webp"] == null ? null : json["webp"],
        frames: json["frames"] == null ? null : json["frames"],
        hash: json["hash"] == null ? null : json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "width": width == null ? null : width,
        "size": size == null ? null : size,
        "url": url == null ? null : url,
        "mp4_size": mp4Size == null ? null : mp4Size,
        "mp4": mp4 == null ? null : mp4,
        "webp_size": webpSize == null ? null : webpSize,
        "webp": webp == null ? null : webp,
        "frames": frames == null ? null : frames,
        "hash": hash == null ? null : hash,
      };
}

class Looping {
  Looping({
    this.mp4Size,
    this.mp4,
  });

  String mp4Size;
  String mp4;

  Looping copyWith({
    String mp4Size,
    String mp4,
  }) =>
      Looping(
        mp4Size: mp4Size ?? this.mp4Size,
        mp4: mp4 ?? this.mp4,
      );

  factory Looping.fromRawJson(String str) => Looping.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Looping.fromJson(Map<String, dynamic> json) => Looping(
        mp4Size: json["mp4_size"] == null ? null : json["mp4_size"],
        mp4: json["mp4"] == null ? null : json["mp4"],
      );

  Map<String, dynamic> toJson() => {
        "mp4_size": mp4Size == null ? null : mp4Size,
        "mp4": mp4 == null ? null : mp4,
      };
}
