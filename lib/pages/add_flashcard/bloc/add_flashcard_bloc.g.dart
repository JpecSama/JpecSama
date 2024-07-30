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
      isReversable: json['is_reversable'] as bool? ?? true,
      isSubmitting: json['is_submitting'] as bool? ?? false,
    );

Map<String, dynamic> _$$AddFlashcardStateImplToJson(
        _$AddFlashcardStateImpl instance) =>
    <String, dynamic>{
      'source_locale': instance.sourceLocale,
      'dest_locale': instance.destLocale,
      'search_text': instance.searchText,
      'is_reversable': instance.isReversable,
      'is_submitting': instance.isSubmitting,
    };
