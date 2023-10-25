// The 'merkle_tree' program.
program merkle_tree.aleo {

    struct FieldTuple {
        left: field,
        right: field,
    }

    struct MerkleTree {
        h1: field,
        h2: field,
        h3: field,
        h4: field,

        h12: field,
        h34: field,

        root: field,
    }

    transition construct_tree(
        item1: field, 
        item2: field, 
        item3: field, 
        item4: field
    ) -> MerkleTree {
        let h1: field = BHP256::hash_to_field(item1);
        let h2: field = BHP256::hash_to_field(item2);
        let h3: field = BHP256::hash_to_field(item3);
        let h4: field = BHP256::hash_to_field(item4);

        let h12: field = BHP256::hash_to_field(FieldTuple {
            left: h1,
            right: h2,
        });

        let h34: field = BHP256::hash_to_field(FieldTuple {
            left: h3,
            right: h4,
        });

        let root: field = BHP256::hash_to_field(FieldTuple {
            left: h12,
            right: h34,
        });

        return MerkleTree {
            h1: h1,
            h2: h2,
            h3: h3,
            h4: h4,

            h12: h12,
            h34: h34,

            root: root,
        };
    }

    transition prove_tree(
        item: field, 
        sibling_l1: field,
        is_left_l1: bool,

        sibling_l2: field,
        is_left_l2: bool,

        root: field
    ) -> bool {
        let hash_item: field = BHP256::hash_to_field(item); 

        let level_1: field = 0field;

        if is_left_l1 == true {
            level_1 = BHP256::hash_to_field(FieldTuple {
                left: sibling_l1,
                right: hash_item, 
            });
        } else {
            level_1 = BHP256::hash_to_field(FieldTuple {
                left: hash_item,
                right: sibling_l1, 
            });
        }

        let current_root: field = 0field;

        if is_left_l2 == true {
            current_root = BHP256::hash_to_field(FieldTuple {
                left: sibling_l2,
                right: level_1,
            });
        } else {
            current_root = BHP256::hash_to_field(FieldTuple {
                left: level_1,
                right: sibling_l2,
            });
        }

        return root == current_root;
    }
}
