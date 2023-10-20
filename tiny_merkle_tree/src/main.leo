// The 'tiny_merkle_tree' program.
program tiny_merkle_tree.aleo {

    // Merkle Tree with 4 leaves
    //                root
    //    node_l1_1           node_l1_2
    //  hash0     hash1   hash2       hash3
    //    |         |       |           | 
    //  leaf0     leaf1   leaf2       leaf3
    struct MerkleTree_4 {
      root: field,
      hash0: field, // hashes of the leaves
      hash1: field,
      hash2: field,
      hash3: field,
      node_l1_1: field, // layer1 node 1
      node_l1_2: field // layer1 node 2
    }

    // 2-tuple
    struct Tuple {
      t0: field,
      t1: field
    }

    // 3-tuple
    struct Tuple3 {
      t0: field,
      t1: field,
      t2: field
    }

    function create_merkle_tree(leaves: [field; 4]) -> MerkleTree_4 {
      let hash0: field = Poseidon2::hash_to_field(leaves[0u8]);
      let hash1: field = Poseidon2::hash_to_field(leaves[1u8]);
      let hash2: field = Poseidon2::hash_to_field(leaves[2u8]);
      let hash3: field = Poseidon2::hash_to_field(leaves[3u8]);

      // hashes hash 0 & 1 together, and hash 2 & 3
      let node_l1_1: field = Poseidon2::hash_to_field(Tuple { t0: hash0, t1: hash1 });
      let node_l1_2: field = Poseidon2::hash_to_field(Tuple { t0: hash2, t1: hash3 });

      // hash the nodes to get the root
      let root: field = Poseidon2::hash_to_field(Tuple { t0: node_l1_1, t1: node_l1_2});

      let merkle_tree: MerkleTree_4 = MerkleTree_4 {
        root: root,
        hash0: hash0,
        hash1: hash1,
        hash2: hash2,
        hash3: hash3,
        node_l1_1: node_l1_1,
        node_l1_2: node_l1_2
      };

      return merkle_tree;
    }

    transition get_merkle_tree(leaves: [field; 4]) -> MerkleTree_4 {
      return create_merkle_tree(leaves);
    }

    // Obtain Merkle proof for the given index for the merkle tree that is constructed with given 4 leaves.
    transition get_merkle_proof(merkle_tree: MerkleTree_4, index: u8) -> Tuple3 {
      let proof_elms: Tuple = extract_proof(merkle_tree, index);
      return Tuple3 { t0: proof_elms.t0, t1: proof_elms.t1, t2: merkle_tree.root };
    }

    function extract_proof(merkle_tree: MerkleTree_4, index: u8) -> Tuple {
      if index == 0u8 {
        return Tuple { t0: merkle_tree.hash1, t1: merkle_tree.node_l1_2 };
      } else if index == 1u8 {
        return Tuple { t0: merkle_tree.hash0, t1: merkle_tree.node_l1_2 };
      } else if index == 2u8 {
        return Tuple { t0: merkle_tree.hash3, t1: merkle_tree.node_l1_1 };
      } else {
        return Tuple { t0: merkle_tree.hash2, t1: merkle_tree.node_l1_1 };
      }
    }

    transition verify_merkle_proof(leaf: field, leaf_index: u8, proof_elms: [field; 2], root: field) -> bool {
      let leaf_hashed: field = Poseidon2::hash_to_field(leaf);
      let next_hash: field = leaf_hashed;
      let updated_index: u8 = leaf_index;

      for i: u8 in 0u8..2u8 {
          if(updated_index % 2u8 == 0u8) {
              next_hash = Poseidon2::hash_to_field(Tuple { t0: next_hash, t1: proof_elms[i]});
          } else {
              next_hash = Poseidon2::hash_to_field(Tuple { t0: proof_elms[i], t1: next_hash});
          }
          updated_index = updated_index / 2u8;
      }
      
      return next_hash == root;
    }
}
