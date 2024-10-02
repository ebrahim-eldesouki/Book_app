import 'package:equatable/equatable.dart';

import 'image_links.dart';
import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo extends Equatable {
  final String title;
  final List<String>? authors;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final num? pageCount;
  final String? printType;
  final List<String>? categories;
  final num? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  const VolumeInfo({
    required this.title,
    this.authors,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    required this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'].toString(),
        authors: List<String>.from(json['authors'] ?? []),
        publishedDate: json['publishedDate']?.toString(),
        description: json['description']?.toString(),
        industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) =>
                IndustryIdentifier.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        readingModes: json['readingModes'] == null
            ? null
            : ReadingModes.fromJson(
                Map<String, dynamic>.from(json['readingModes'])),
        pageCount: num.tryParse(json['pageCount'].toString()),
        printType: json['printType']?.toString(),
        categories: List<String>.from(json['categories'] ?? []),
        averageRating: json['averageRating'],
        ratingsCount: json['ratingsCount'] as int?,
        maturityRating: json['maturityRating']?.toString(),
        allowAnonLogging: json['allowAnonLogging']?.toString().contains("true"),
        contentVersion: json['contentVersion']?.toString(),
        panelizationSummary: json['panelizationSummary'] == null
            ? null
            : PanelizationSummary.fromJson(
                Map<String, dynamic>.from(json['panelizationSummary'])),
        imageLinks:json['imageLinks'] == null ? null :
            ImageLinks.fromJson(Map<String, dynamic>.from(json['imageLinks'])),
        language: json['language']?.toString(),
        previewLink: json['previewLink']?.toString(),
        infoLink: json['infoLink']?.toString(),
        canonicalVolumeLink: json['canonicalVolumeLink']?.toString(),
      );

  Map<String, dynamic> toJson() => {
         'title': title,
        if (authors != null) 'authors': authors,
        if (publishedDate != null) 'publishedDate': publishedDate,
        if (description != null) 'description': description,
        if (industryIdentifiers != null)
          'industryIdentifiers':
              industryIdentifiers?.map((e) => e.toJson()).toList(),
        if (readingModes != null) 'readingModes': readingModes?.toJson(),
        if (pageCount != null) 'pageCount': pageCount,
        if (printType != null) 'printType': printType,
        if (categories != null) 'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        if (maturityRating != null) 'maturityRating': maturityRating,
        if (allowAnonLogging != null) 'allowAnonLogging': allowAnonLogging,
        if (contentVersion != null) 'contentVersion': contentVersion,
        if (panelizationSummary != null)
          'panelizationSummary': panelizationSummary?.toJson(),
        if (language != null) 'language': language,
        if (previewLink != null) 'previewLink': previewLink,
        if (infoLink != null) 'infoLink': infoLink,
        if (canonicalVolumeLink != null)
          'canonicalVolumeLink': canonicalVolumeLink,
      };

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      publishedDate,
      description,
      industryIdentifiers,
      readingModes,
      pageCount,
      printType,
      categories,
      averageRating,
      ratingsCount,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      panelizationSummary,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
