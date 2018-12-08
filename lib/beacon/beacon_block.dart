import 'dart:async';
import 'dart:typed_data';

import 'package:protolith/blockchain/block/block.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/crypto/data_util.dart';
import 'package:protolith/crypto/sha3.dart';
import 'package:protolith/encodings/rlp/rlp_encode.dart';
import 'package:protolith/encodings/serializeables/rlp_serializable.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/data/attestation.dart';
import 'package:singapore/beacon/data/randao.dart';
import 'package:singapore/beacon/data/slot.dart';

class BeaconBlock<M extends BeaconBlockMeta> extends Block<M>
    with
        Attestation<M>,
        Randao<M>,
        Slot<M>,
        RlpEncodeable,
        RlpDecodeable {

  List<Hash256> ancestorHashes;
  Hash256 stateRoot;
  Hash256 candidatePowReceiptRoot;


  @override
  List<dynamic> getRlpElements() => [
    // TODO
  ];

  @override
  List<RlpDecSetter> getRlpSetters() => [
    // TODO
  ];

  @override
  Hash256 computeHash(M meta) {
    this.hash = sha3_256(byteView(encodeRLP(meta)));
    return this.hash;
  }

  @override
  Future<bool> validate(M meta) async {
    // TODO validate block


    return false;
  }

  /// Get the header-bytes used to create the block,
  ///  without the mixHash and nonce.
  Uint8List getTruncatedHeaderBytes() =>
      encodeRLP([
        // TODO
      ]);

}
