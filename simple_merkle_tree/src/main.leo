// The 'simple_merkle_tree' program.
program simple_merkle_tree.aleo {
    // transition main(public a: field) -> bool {
    //     let c: bool = verify_merkle_proof(1field, 1u8, [1field, 1field, 1field, 1field], 1field);
    //     return c;
    // }

    // 2-tuple
    struct Tuple {
      t0: field,
      t1: field
    }

    // Given the leaves, return the values for a Merkle proof of the leaf with given index
    transition get_test_values(leaves: [field; 16], index: u8) -> [field; 5] {
      // Don't know how to do this any easier, since we can't write to arrays after initiation
      let hash0: field = Poseidon2::hash_to_field(leaves[0u8]);
      let hash1: field = Poseidon2::hash_to_field(leaves[1u8]);
      let hash2: field = Poseidon2::hash_to_field(leaves[2u8]);
      let hash3: field = Poseidon2::hash_to_field(leaves[3u8]);
      let hash4: field = Poseidon2::hash_to_field(leaves[4u8]);
      let hash5: field = Poseidon2::hash_to_field(leaves[5u8]);
      let hash6: field = Poseidon2::hash_to_field(leaves[6u8]);
      let hash7: field = Poseidon2::hash_to_field(leaves[7u8]);
      let hash8: field = Poseidon2::hash_to_field(leaves[8u8]);
      let hash9: field = Poseidon2::hash_to_field(leaves[9u8]);
      let hash10: field = Poseidon2::hash_to_field(leaves[10u8]);
      let hash11: field = Poseidon2::hash_to_field(leaves[11u8]);
      let hash12: field = Poseidon2::hash_to_field(leaves[12u8]);
      let hash13: field = Poseidon2::hash_to_field(leaves[13u8]);
      let hash14: field = Poseidon2::hash_to_field(leaves[14u8]);
      let hash15: field = Poseidon2::hash_to_field(leaves[15u8]);

      // Layer 1
      let node_l1_0: field = Poseidon2::hash_to_field(Tuple { t0: hash0, t1: hash1 });
      let node_l1_1: field = Poseidon2::hash_to_field(Tuple { t0: hash2, t1: hash3 });
      let node_l1_2: field = Poseidon2::hash_to_field(Tuple { t0: hash4, t1: hash5 });
      let node_l1_3: field = Poseidon2::hash_to_field(Tuple { t0: hash6, t1: hash7 });
      let node_l1_4: field = Poseidon2::hash_to_field(Tuple { t0: hash8, t1: hash9 });
      let node_l1_5: field = Poseidon2::hash_to_field(Tuple { t0: hash10, t1: hash11 });
      let node_l1_6: field = Poseidon2::hash_to_field(Tuple { t0: hash12, t1: hash13 });
      let node_l1_7: field = Poseidon2::hash_to_field(Tuple { t0: hash14, t1: hash15 });

      // Layer 2
      let node_l2_0: field = Poseidon2::hash_to_field(Tuple { t0: node_l1_0, t1: node_l1_1 });
      let node_l2_1: field = Poseidon2::hash_to_field(Tuple { t0: node_l1_2, t1: node_l1_3 });
      let node_l2_2: field = Poseidon2::hash_to_field(Tuple { t0: node_l1_4, t1: node_l1_5 });
      let node_l2_3: field = Poseidon2::hash_to_field(Tuple { t0: node_l1_6, t1: node_l1_7 });

      // Layer 3
      let node_l3_0: field = Poseidon2::hash_to_field(Tuple { t0: node_l2_0, t1: node_l2_1 });
      let node_l3_1: field = Poseidon2::hash_to_field(Tuple { t0: node_l2_2, t1: node_l2_3 });

      // Root 
      let root: field = Poseidon2::hash_to_field(Tuple { t0: node_l3_0, t1: node_l3_1 });

// Full tree:

//                                                      Root
//                           node_l3_0                                              node_l3_1
//
//            node_l2_0                   node_l2_1                   node_l2_2                     node_l2_3
// 
//   node_l1_0    node_l1_1       node_l1_2     node_l1_3     node_l1_4     node_l1_5       node_l1_6       node_l1_7
//
// hash0  hash1  hash2  hash3  hash4  hash5  hash6  hash7   hash8  hash9  hash10  hash11  hash12  hash13  hash14  hash15
//  |      |      |      |      |      |      |      |        |      |       |       |       |       |        |        |
// leaf0  leaf1  leaf2  leaf3  leaf4  leaf5  leaf6  leaf7   leaf8  leaf9  leaf10  leaf11  leaf12  leaf13  leaf14  leaf15


      // TODO do this more efficiently
      // Challenges: array indices must be constant, there is no array assigning possible after initialization
      if index == 0u8 {
        return [hash1, node_l1_1, node_l2_1, node_l3_1, root];
      } else if index == 1u8 {
        return [hash0, node_l1_1, node_l2_1, node_l3_1, root];
      } else if index == 2u8 {
        return [hash3, node_l1_0, node_l2_1, node_l3_1, root];
      } else if index == 3u8 {
        return [hash2, node_l1_0, node_l2_1, node_l3_1, root];
      } else if index == 4u8 {
        return [hash5, node_l1_3, node_l2_0, node_l3_1, root];
      } else if index == 5u8 {
        return [hash4, node_l1_3, node_l2_0, node_l3_1, root];
      } else if index == 6u8 {
        return [hash7, node_l1_2, node_l2_0, node_l3_1, root];
      } else if index == 7u8 {
        return [hash6, node_l1_2, node_l2_0, node_l3_1, root];
      } else if index == 8u8 {
        return [hash9, node_l1_5, node_l2_3, node_l3_0, root];
      } else if index == 9u8 {
        return [hash8, node_l1_5, node_l2_3, node_l3_0, root];
      } else if index == 10u8 {
        return [hash11, node_l1_4, node_l2_3, node_l3_0, root];
      } else if index == 11u8 {
        return [hash10, node_l1_4, node_l2_3, node_l3_0, root];
      } else if index == 12u8 {
        return [hash13, node_l1_7, node_l2_2, node_l3_0, root];
      } else if index == 13u8 {
        return [hash12, node_l1_7, node_l2_2, node_l3_0, root];
      } else if index == 14u8 {
        return [hash15, node_l1_6, node_l2_2, node_l3_0, root];
      } else {
        return [hash14, node_l1_6, node_l2_2, node_l3_0, root];
      }
    }

    transition verify_merkle_proof(leaf: field, leaf_index: u8, merkle_proof: [field; 4], root: field) -> bool {
        // hash of the leaf
        let leaf_hashed: field = Poseidon2::hash_to_field(leaf);
        let next_hash: field = leaf_hashed;
        let updated_index: u8 = leaf_index;
        
        for i: u8 in 0u8..4u8 {
            if(updated_index & 1u8 == 1u8) {
                next_hash = Poseidon2::hash_to_field(Tuple { t0: merkle_proof[i], t1: next_hash });
            } else {
                next_hash = Poseidon2::hash_to_field(Tuple { t0: next_hash, t1: merkle_proof[i] });
            }
            updated_index = updated_index / 2u8;
        }
        
        return next_hash == root;
    }
}
