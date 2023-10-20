// The 'simple_merkle_tree' program.
program simple_merkle_tree.aleo {
    transition main(public a: field) -> bool {
        let c: bool = verify_merkle_proof(1field, 1u8, [1field, 1field, 1field, 1field], 1field);
        return c;
    }

    inline verify_merkle_proof(leaf: field, leaf_index: u8, merkle_proof: [field; 4], root: field) -> bool {
        // hash of the leaf
        let leaf_hashed: field = Poseidon2::hash_to_field(leaf);
        let next_hash: field = leaf_hashed;
        let updated_index: u8 = leaf_index;
        let temp: field = 0field;
        

        for i: u8 in 0u8..4u8 {
            if(updated_index & 1u8 == 1u8) {
                temp = next_hash * merkle_proof[i] * 3field; // make different hashes
                next_hash = Poseidon2::hash_to_field(temp);
            } else {
                temp = next_hash * merkle_proof[i] * 2field;
                next_hash = Poseidon2::hash_to_field(temp);
            }
            updated_index = updated_index / 2u8;
        }
        
        return next_hash == root;
    }
}
