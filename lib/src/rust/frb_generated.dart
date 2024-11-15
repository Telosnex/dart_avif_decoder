// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({
    required RustLibApi api,
  }) {
    instance.initMockImpl(
      api: api,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {
    await api.crateApiSimpleInitApp();
  }

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.6.0';

  @override
  int get rustContentHash => -1483505722;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'dart_avif_decoder',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  Future<Frame> crateApiSimpleDecodeSingleFrameImage(
      {required List<int> avifBytes});

  Future<bool> crateApiSimpleDisposeDecoder({required String key});

  Future<Uint8List> crateApiSimpleEncodeAvif(
      {required int width,
      required int height,
      required int speed,
      required int maxThreads,
      required BigInt timescale,
      required int maxQuantizer,
      required int minQuantizer,
      required int maxQuantizerAlpha,
      required int minQuantizerAlpha,
      required List<EncodeFrame> imageSequence,
      required List<int> exifData});

  Future<Frame> crateApiSimpleGetNextFrame({required String key});

  String crateApiSimpleGreet({required String name});

  Future<void> crateApiSimpleInitApp();

  Future<AvifInfo> crateApiSimpleInitMemoryDecoder(
      {required String key, required List<int> avifBytes});

  Future<bool> crateApiSimpleResetDecoder({required String key});
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<Frame> crateApiSimpleDecodeSingleFrameImage(
      {required List<int> avifBytes}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_list_prim_u_8_loose(avifBytes, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 1, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_frame,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleDecodeSingleFrameImageConstMeta,
      argValues: [avifBytes],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleDecodeSingleFrameImageConstMeta =>
      const TaskConstMeta(
        debugName: "decode_single_frame_image",
        argNames: ["avifBytes"],
      );

  @override
  Future<bool> crateApiSimpleDisposeDecoder({required String key}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(key, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 2, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_bool,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleDisposeDecoderConstMeta,
      argValues: [key],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleDisposeDecoderConstMeta =>
      const TaskConstMeta(
        debugName: "dispose_decoder",
        argNames: ["key"],
      );

  @override
  Future<Uint8List> crateApiSimpleEncodeAvif(
      {required int width,
      required int height,
      required int speed,
      required int maxThreads,
      required BigInt timescale,
      required int maxQuantizer,
      required int minQuantizer,
      required int maxQuantizerAlpha,
      required int minQuantizerAlpha,
      required List<EncodeFrame> imageSequence,
      required List<int> exifData}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_u_32(width, serializer);
        sse_encode_u_32(height, serializer);
        sse_encode_i_32(speed, serializer);
        sse_encode_i_32(maxThreads, serializer);
        sse_encode_u_64(timescale, serializer);
        sse_encode_i_32(maxQuantizer, serializer);
        sse_encode_i_32(minQuantizer, serializer);
        sse_encode_i_32(maxQuantizerAlpha, serializer);
        sse_encode_i_32(minQuantizerAlpha, serializer);
        sse_encode_list_encode_frame(imageSequence, serializer);
        sse_encode_list_prim_u_8_loose(exifData, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 3, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_list_prim_u_8_strict,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleEncodeAvifConstMeta,
      argValues: [
        width,
        height,
        speed,
        maxThreads,
        timescale,
        maxQuantizer,
        minQuantizer,
        maxQuantizerAlpha,
        minQuantizerAlpha,
        imageSequence,
        exifData
      ],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleEncodeAvifConstMeta => const TaskConstMeta(
        debugName: "encode_avif",
        argNames: [
          "width",
          "height",
          "speed",
          "maxThreads",
          "timescale",
          "maxQuantizer",
          "minQuantizer",
          "maxQuantizerAlpha",
          "minQuantizerAlpha",
          "imageSequence",
          "exifData"
        ],
      );

  @override
  Future<Frame> crateApiSimpleGetNextFrame({required String key}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(key, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 4, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_frame,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleGetNextFrameConstMeta,
      argValues: [key],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleGetNextFrameConstMeta => const TaskConstMeta(
        debugName: "get_next_frame",
        argNames: ["key"],
      );

  @override
  String crateApiSimpleGreet({required String name}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(name, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 5)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_String,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleGreetConstMeta,
      argValues: [name],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleGreetConstMeta => const TaskConstMeta(
        debugName: "greet",
        argNames: ["name"],
      );

  @override
  Future<void> crateApiSimpleInitApp() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 6, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleInitAppConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleInitAppConstMeta => const TaskConstMeta(
        debugName: "init_app",
        argNames: [],
      );

  @override
  Future<AvifInfo> crateApiSimpleInitMemoryDecoder(
      {required String key, required List<int> avifBytes}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(key, serializer);
        sse_encode_list_prim_u_8_loose(avifBytes, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 7, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_avif_info,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleInitMemoryDecoderConstMeta,
      argValues: [key, avifBytes],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleInitMemoryDecoderConstMeta =>
      const TaskConstMeta(
        debugName: "init_memory_decoder",
        argNames: ["key", "avifBytes"],
      );

  @override
  Future<bool> crateApiSimpleResetDecoder({required String key}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(key, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 8, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_bool,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleResetDecoderConstMeta,
      argValues: [key],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleResetDecoderConstMeta => const TaskConstMeta(
        debugName: "reset_decoder",
        argNames: ["key"],
      );

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  AvifInfo dco_decode_avif_info(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 4)
      throw Exception('unexpected arr length: expect 4 but see ${arr.length}');
    return AvifInfo(
      width: dco_decode_u_32(arr[0]),
      height: dco_decode_u_32(arr[1]),
      imageCount: dco_decode_u_32(arr[2]),
      duration: dco_decode_f_64(arr[3]),
    );
  }

  @protected
  bool dco_decode_bool(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as bool;
  }

  @protected
  EncodeFrame dco_decode_encode_frame(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return EncodeFrame(
      data: dco_decode_list_prim_u_8_strict(arr[0]),
      durationInTimescale: dco_decode_u_64(arr[1]),
    );
  }

  @protected
  double dco_decode_f_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as double;
  }

  @protected
  Frame dco_decode_frame(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 4)
      throw Exception('unexpected arr length: expect 4 but see ${arr.length}');
    return Frame(
      data: dco_decode_list_prim_u_8_strict(arr[0]),
      duration: dco_decode_f_64(arr[1]),
      width: dco_decode_u_32(arr[2]),
      height: dco_decode_u_32(arr[3]),
    );
  }

  @protected
  int dco_decode_i_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  List<EncodeFrame> dco_decode_list_encode_frame(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_encode_frame).toList();
  }

  @protected
  List<int> dco_decode_list_prim_u_8_loose(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as List<int>;
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  int dco_decode_u_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  BigInt dco_decode_u_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  AvifInfo sse_decode_avif_info(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_width = sse_decode_u_32(deserializer);
    var var_height = sse_decode_u_32(deserializer);
    var var_imageCount = sse_decode_u_32(deserializer);
    var var_duration = sse_decode_f_64(deserializer);
    return AvifInfo(
        width: var_width,
        height: var_height,
        imageCount: var_imageCount,
        duration: var_duration);
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  EncodeFrame sse_decode_encode_frame(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_data = sse_decode_list_prim_u_8_strict(deserializer);
    var var_durationInTimescale = sse_decode_u_64(deserializer);
    return EncodeFrame(
        data: var_data, durationInTimescale: var_durationInTimescale);
  }

  @protected
  double sse_decode_f_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getFloat64();
  }

  @protected
  Frame sse_decode_frame(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_data = sse_decode_list_prim_u_8_strict(deserializer);
    var var_duration = sse_decode_f_64(deserializer);
    var var_width = sse_decode_u_32(deserializer);
    var var_height = sse_decode_u_32(deserializer);
    return Frame(
        data: var_data,
        duration: var_duration,
        width: var_width,
        height: var_height);
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  List<EncodeFrame> sse_decode_list_encode_frame(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <EncodeFrame>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_encode_frame(deserializer));
    }
    return ans_;
  }

  @protected
  List<int> sse_decode_list_prim_u_8_loose(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  int sse_decode_u_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint32();
  }

  @protected
  BigInt sse_decode_u_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_avif_info(AvifInfo self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_u_32(self.width, serializer);
    sse_encode_u_32(self.height, serializer);
    sse_encode_u_32(self.imageCount, serializer);
    sse_encode_f_64(self.duration, serializer);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }

  @protected
  void sse_encode_encode_frame(EncodeFrame self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(self.data, serializer);
    sse_encode_u_64(self.durationInTimescale, serializer);
  }

  @protected
  void sse_encode_f_64(double self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putFloat64(self);
  }

  @protected
  void sse_encode_frame(Frame self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(self.data, serializer);
    sse_encode_f_64(self.duration, serializer);
    sse_encode_u_32(self.width, serializer);
    sse_encode_u_32(self.height, serializer);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }

  @protected
  void sse_encode_list_encode_frame(
      List<EncodeFrame> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_encode_frame(item, serializer);
    }
  }

  @protected
  void sse_encode_list_prim_u_8_loose(
      List<int> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer
        .putUint8List(self is Uint8List ? self : Uint8List.fromList(self));
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint32(self);
  }

  @protected
  void sse_encode_u_64(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }
}
