import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_response.g.dart';

@immutable
@JsonSerializable()
class EventResponse extends Equatable {
  final String eventId;

  const EventResponse({
    required this.eventId,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return _$EventResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EventResponseToJson(this);

  @override
  List<Object> get props => [eventId];
}
