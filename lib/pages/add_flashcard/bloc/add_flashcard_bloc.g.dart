// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_flashcard_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddFlashcardStateImpl _$$AddFlashcardStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AddFlashcardStateImpl(
      sourceLocale: json['source_locale'] as String,
      destLocale: json['dest_locale'] as String,
      searchText: json['search_text'] as String,
      translatorApi:
          $enumDecodeNullable(_$ApiTranslatorEnumMap, json['translator_api']) ??
              ApiTranslator.deepl,
      possibleTranslatorApis:
          (json['possible_translator_apis'] as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$ApiTranslatorEnumMap, e))
                  .toList() ??
              const [],
      isReversable: json['is_reversable'] as bool? ?? true,
      isSubmitting: json['is_submitting'] as bool? ?? false,
    );

Map<String, dynamic> _$$AddFlashcardStateImplToJson(
        _$AddFlashcardStateImpl instance) =>
    <String, dynamic>{
      'source_locale': instance.sourceLocale,
      'dest_locale': instance.destLocale,
      'search_text': instance.searchText,
      'translator_api': _$ApiTranslatorEnumMap[instance.translatorApi]!,
      'possible_translator_apis': instance.possibleTranslatorApis
          .map((e) => _$ApiTranslatorEnumMap[e]!)
          .toList(),
      'is_reversable': instance.isReversable,
      'is_submitting': instance.isSubmitting,
    };

const _$ApiTranslatorEnumMap = {
  ApiTranslator.deepl: 'deepl',
  ApiTranslator.jisho: 'jisho',
};
