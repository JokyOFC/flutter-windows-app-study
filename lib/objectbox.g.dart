// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'screens/models/task_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 7214491017832594301),
      name: 'TaskModel',
      lastPropertyId: const IdUid(5, 1655566399651433864),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6804412865067916339),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 358390340689395022),
            name: 'task_title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4677572139541875380),
            name: 'task_description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 275101464001428965),
            name: 'task_done',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1655566399651433864),
            name: 'creation_date',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 7214491017832594301),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [7809002115211045772],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        1134669219972921530,
        8153012178444545094,
        2152717199528820739,
        6551879938808120358,
        3348651511440433624
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    TaskModel: EntityDefinition<TaskModel>(
        model: _entities[0],
        toOneRelations: (TaskModel object) => [],
        toManyRelations: (TaskModel object) => {},
        getId: (TaskModel object) => object.id,
        setId: (TaskModel object, int id) {
          object.id = id;
        },
        objectToFB: (TaskModel object, fb.Builder fbb) {
          final task_titleOffset = object.task_title == null
              ? null
              : fbb.writeString(object.task_title!);
          final task_descriptionOffset = object.task_description == null
              ? null
              : fbb.writeString(object.task_description!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, task_titleOffset);
          fbb.addOffset(2, task_descriptionOffset);
          fbb.addBool(3, object.task_done);
          fbb.addInt64(4, object.creation_date?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final creation_dateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final object = TaskModel(
              task_title: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              task_description: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              task_done: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              creation_date: creation_dateValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(creation_dateValue))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [TaskModel] entity fields to define ObjectBox queries.
class TaskModel_ {
  /// see [TaskModel.id]
  static final id = QueryIntegerProperty<TaskModel>(_entities[0].properties[0]);

  /// see [TaskModel.task_title]
  static final task_title =
      QueryStringProperty<TaskModel>(_entities[0].properties[1]);

  /// see [TaskModel.task_description]
  static final task_description =
      QueryStringProperty<TaskModel>(_entities[0].properties[2]);

  /// see [TaskModel.task_done]
  static final task_done =
      QueryBooleanProperty<TaskModel>(_entities[0].properties[3]);

  /// see [TaskModel.creation_date]
  static final creation_date =
      QueryIntegerProperty<TaskModel>(_entities[0].properties[4]);
}
