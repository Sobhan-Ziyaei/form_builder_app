// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/models/custom_form.dart';
import 'data/models/custom_form_field.dart';
import 'data/models/custom_form_field_value.dart';
import 'data/models/user_form_values.dart';
import 'data/models/user_forms.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6109287760481377727),
      name: 'CustomForm',
      lastPropertyId: const IdUid(3, 5808274686897078254),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4566605879096507945),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8183655943572068107),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5808274686897078254),
            name: 'description',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 8897772665128299877),
            name: 'customFormFields',
            targetId: const IdUid(2, 5461765472407713414)),
        ModelRelation(
            id: const IdUid(2, 1352961560810338500),
            name: 'customFormFieldValues',
            targetId: const IdUid(3, 8323905850372227726))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 5461765472407713414),
      name: 'CustomFormField',
      lastPropertyId: const IdUid(5, 7966458645851351151),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2424238504401768763),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5359060235795681080),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2551344093199541806),
            name: 'isRequired',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1176773318473655894),
            name: 'type',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7966458645851351151),
            name: 'customFormId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 1570710689281906697),
            relationTarget: 'CustomForm')
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(3, 4503967139515961417),
            name: 'customFormFieldValues',
            targetId: const IdUid(3, 8323905850372227726))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 8323905850372227726),
      name: 'CustomFormFieldValue',
      lastPropertyId: const IdUid(4, 8985747499966177315),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4761834726017433959),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1796605303795217022),
            name: 'value',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2237761880148405487),
            name: 'customFormId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 6614479421664191725),
            relationTarget: 'CustomForm'),
        ModelProperty(
            id: const IdUid(4, 8985747499966177315),
            name: 'customFormFieldId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 6277195397160658925),
            relationTarget: 'CustomFormField')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 6279414105027937678),
      name: 'UserFormValues',
      lastPropertyId: const IdUid(7, 1064391518448079630),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8743111062917754702),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2514066356225900319),
            name: 'userFormId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 997031741357501324),
            relationTarget: 'UserForms'),
        ModelProperty(
            id: const IdUid(3, 6694534395539012885),
            name: 'customFormId',
            type: 11,
            flags: 520,
            indexId: const IdUid(5, 8748118156365696549),
            relationTarget: 'CustomForm'),
        ModelProperty(
            id: const IdUid(4, 817325051913285826),
            name: 'customFormFieldId',
            type: 11,
            flags: 520,
            indexId: const IdUid(6, 4230176633490132725),
            relationTarget: 'CustomFormField'),
        ModelProperty(
            id: const IdUid(5, 6094348518374968979),
            name: 'stringVal',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4369076656450010234),
            name: 'itemId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1064391518448079630),
            name: 'numberVal',
            type: 8,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 1335536571117374342),
      name: 'UserForms',
      lastPropertyId: const IdUid(3, 5921028217859809498),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6042354081480505795),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7201365376687611313),
            name: 'date',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5921028217859809498),
            name: 'customFormId',
            type: 11,
            flags: 520,
            indexId: const IdUid(7, 4341566096628339302),
            relationTarget: 'CustomForm')
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(5, 8134484813546372692),
            name: 'userFormValues',
            targetId: const IdUid(4, 6279414105027937678))
      ],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
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

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(5, 1335536571117374342),
      lastIndexId: const IdUid(7, 4341566096628339302),
      lastRelationId: const IdUid(5, 8134484813546372692),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [4841581502436292443],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    CustomForm: EntityDefinition<CustomForm>(
        model: _entities[0],
        toOneRelations: (CustomForm object) => [],
        toManyRelations: (CustomForm object) => {
              RelInfo<CustomForm>.toMany(1, object.id): object.customFormFields,
              RelInfo<CustomForm>.toMany(2, object.id):
                  object.customFormFieldValues
            },
        getId: (CustomForm object) => object.id,
        setId: (CustomForm object, int id) {
          object.id = id;
        },
        objectToFB: (CustomForm object, fb.Builder fbb) {
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8);
          final object = CustomForm(
              id: idParam, title: titleParam, description: descriptionParam);
          InternalToManyAccess.setRelInfo<CustomForm>(object.customFormFields,
              store, RelInfo<CustomForm>.toMany(1, object.id));
          InternalToManyAccess.setRelInfo<CustomForm>(
              object.customFormFieldValues,
              store,
              RelInfo<CustomForm>.toMany(2, object.id));
          return object;
        }),
    CustomFormField: EntityDefinition<CustomFormField>(
        model: _entities[1],
        toOneRelations: (CustomFormField object) => [object.customForm],
        toManyRelations: (CustomFormField object) => {
              RelInfo<CustomFormField>.toMany(3, object.id):
                  object.customFormFieldValues
            },
        getId: (CustomFormField object) => object.id,
        setId: (CustomFormField object, int id) {
          object.id = id;
        },
        objectToFB: (CustomFormField object, fb.Builder fbb) {
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final typeOffset =
              object.type == null ? null : fbb.writeString(object.type!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addBool(2, object.isRequired);
          fbb.addOffset(3, typeOffset);
          fbb.addInt64(4, object.customForm.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final isRequiredParam =
              const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 8);
          final typeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final object = CustomFormField(
              id: idParam,
              title: titleParam,
              isRequired: isRequiredParam,
              type: typeParam);
          object.customForm.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.customForm.attach(store);
          InternalToManyAccess.setRelInfo<CustomFormField>(
              object.customFormFieldValues,
              store,
              RelInfo<CustomFormField>.toMany(3, object.id));
          return object;
        }),
    CustomFormFieldValue: EntityDefinition<CustomFormFieldValue>(
        model: _entities[2],
        toOneRelations: (CustomFormFieldValue object) =>
            [object.customForm, object.customFormField],
        toManyRelations: (CustomFormFieldValue object) => {},
        getId: (CustomFormFieldValue object) => object.id,
        setId: (CustomFormFieldValue object, int id) {
          object.id = id;
        },
        objectToFB: (CustomFormFieldValue object, fb.Builder fbb) {
          final valueOffset =
              object.value == null ? null : fbb.writeString(object.value!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, valueOffset);
          fbb.addInt64(2, object.customForm.targetId);
          fbb.addInt64(3, object.customFormField.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final valueParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final object = CustomFormFieldValue(id: idParam, value: valueParam);
          object.customForm.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.customForm.attach(store);
          object.customFormField.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.customFormField.attach(store);
          return object;
        }),
    UserFormValues: EntityDefinition<UserFormValues>(
        model: _entities[3],
        toOneRelations: (UserFormValues object) =>
            [object.userForm, object.customForm, object.customFormField],
        toManyRelations: (UserFormValues object) => {},
        getId: (UserFormValues object) => object.id,
        setId: (UserFormValues object, int id) {
          object.id = id;
        },
        objectToFB: (UserFormValues object, fb.Builder fbb) {
          final stringValOffset = object.stringVal == null
              ? null
              : fbb.writeString(object.stringVal!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.userForm.targetId);
          fbb.addInt64(2, object.customForm.targetId);
          fbb.addInt64(3, object.customFormField.targetId);
          fbb.addOffset(4, stringValOffset);
          fbb.addInt64(5, object.itemId);
          fbb.addFloat64(6, object.numberVal);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final stringValParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 12);
          final numberValParam = const fb.Float64Reader()
              .vTableGetNullable(buffer, rootOffset, 16);
          final itemIdParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14);
          final object = UserFormValues(
              id: idParam,
              stringVal: stringValParam,
              numberVal: numberValParam,
              itemId: itemIdParam);
          object.userForm.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.userForm.attach(store);
          object.customForm.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.customForm.attach(store);
          object.customFormField.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.customFormField.attach(store);
          return object;
        }),
    UserForms: EntityDefinition<UserForms>(
        model: _entities[4],
        toOneRelations: (UserForms object) => [object.customForm],
        toManyRelations: (UserForms object) =>
            {RelInfo<UserForms>.toMany(5, object.id): object.userFormValues},
        getId: (UserForms object) => object.id,
        setId: (UserForms object, int id) {
          object.id = id;
        },
        objectToFB: (UserForms object, fb.Builder fbb) {
          final dateOffset =
              object.date == null ? null : fbb.writeString(object.date!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, dateOffset);
          fbb.addInt64(2, object.customForm.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final dateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final object = UserForms(id: idParam, date: dateParam);
          object.customForm.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.customForm.attach(store);
          InternalToManyAccess.setRelInfo<UserForms>(object.userFormValues,
              store, RelInfo<UserForms>.toMany(5, object.id));
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [CustomForm] entity fields to define ObjectBox queries.
class CustomForm_ {
  /// see [CustomForm.id]
  static final id =
      QueryIntegerProperty<CustomForm>(_entities[0].properties[0]);

  /// see [CustomForm.title]
  static final title =
      QueryStringProperty<CustomForm>(_entities[0].properties[1]);

  /// see [CustomForm.description]
  static final description =
      QueryStringProperty<CustomForm>(_entities[0].properties[2]);

  /// see [CustomForm.customFormFields]
  static final customFormFields =
      QueryRelationToMany<CustomForm, CustomFormField>(
          _entities[0].relations[0]);

  /// see [CustomForm.customFormFieldValues]
  static final customFormFieldValues =
      QueryRelationToMany<CustomForm, CustomFormFieldValue>(
          _entities[0].relations[1]);
}

/// [CustomFormField] entity fields to define ObjectBox queries.
class CustomFormField_ {
  /// see [CustomFormField.id]
  static final id =
      QueryIntegerProperty<CustomFormField>(_entities[1].properties[0]);

  /// see [CustomFormField.title]
  static final title =
      QueryStringProperty<CustomFormField>(_entities[1].properties[1]);

  /// see [CustomFormField.isRequired]
  static final isRequired =
      QueryBooleanProperty<CustomFormField>(_entities[1].properties[2]);

  /// see [CustomFormField.type]
  static final type =
      QueryStringProperty<CustomFormField>(_entities[1].properties[3]);

  /// see [CustomFormField.customForm]
  static final customForm = QueryRelationToOne<CustomFormField, CustomForm>(
      _entities[1].properties[4]);

  /// see [CustomFormField.customFormFieldValues]
  static final customFormFieldValues =
      QueryRelationToMany<CustomFormField, CustomFormFieldValue>(
          _entities[1].relations[0]);
}

/// [CustomFormFieldValue] entity fields to define ObjectBox queries.
class CustomFormFieldValue_ {
  /// see [CustomFormFieldValue.id]
  static final id =
      QueryIntegerProperty<CustomFormFieldValue>(_entities[2].properties[0]);

  /// see [CustomFormFieldValue.value]
  static final value =
      QueryStringProperty<CustomFormFieldValue>(_entities[2].properties[1]);

  /// see [CustomFormFieldValue.customForm]
  static final customForm =
      QueryRelationToOne<CustomFormFieldValue, CustomForm>(
          _entities[2].properties[2]);

  /// see [CustomFormFieldValue.customFormField]
  static final customFormField =
      QueryRelationToOne<CustomFormFieldValue, CustomFormField>(
          _entities[2].properties[3]);
}

/// [UserFormValues] entity fields to define ObjectBox queries.
class UserFormValues_ {
  /// see [UserFormValues.id]
  static final id =
      QueryIntegerProperty<UserFormValues>(_entities[3].properties[0]);

  /// see [UserFormValues.userForm]
  static final userForm =
      QueryRelationToOne<UserFormValues, UserForms>(_entities[3].properties[1]);

  /// see [UserFormValues.customForm]
  static final customForm = QueryRelationToOne<UserFormValues, CustomForm>(
      _entities[3].properties[2]);

  /// see [UserFormValues.customFormField]
  static final customFormField =
      QueryRelationToOne<UserFormValues, CustomFormField>(
          _entities[3].properties[3]);

  /// see [UserFormValues.stringVal]
  static final stringVal =
      QueryStringProperty<UserFormValues>(_entities[3].properties[4]);

  /// see [UserFormValues.itemId]
  static final itemId =
      QueryIntegerProperty<UserFormValues>(_entities[3].properties[5]);

  /// see [UserFormValues.numberVal]
  static final numberVal =
      QueryDoubleProperty<UserFormValues>(_entities[3].properties[6]);
}

/// [UserForms] entity fields to define ObjectBox queries.
class UserForms_ {
  /// see [UserForms.id]
  static final id = QueryIntegerProperty<UserForms>(_entities[4].properties[0]);

  /// see [UserForms.date]
  static final date =
      QueryStringProperty<UserForms>(_entities[4].properties[1]);

  /// see [UserForms.customForm]
  static final customForm =
      QueryRelationToOne<UserForms, CustomForm>(_entities[4].properties[2]);

  /// see [UserForms.userFormValues]
  static final userFormValues =
      QueryRelationToMany<UserForms, UserFormValues>(_entities[4].relations[0]);
}
