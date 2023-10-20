program tiny_merkle_tree.aleo;

struct MerkleTree_4:
    root as field;
    hash0 as field;
    hash1 as field;
    hash2 as field;
    hash3 as field;
    node_l1_1 as field;
    node_l1_2 as field;

struct Tuple:
    t0 as field;
    t1 as field;

struct Tuple3:
    t0 as field;
    t1 as field;
    t2 as field;


closure create_merkle_tree:
    input r0 as [field; 4u32];
    hash.psd2 r0[0u32] into r1 as field;
    hash.psd2 r0[1u32] into r2 as field;
    hash.psd2 r0[2u32] into r3 as field;
    hash.psd2 r0[3u32] into r4 as field;
    cast r1 r2 into r5 as Tuple;
    hash.psd2 r5 into r6 as field;
    cast r3 r4 into r7 as Tuple;
    hash.psd2 r7 into r8 as field;
    cast r6 r8 into r9 as Tuple;
    hash.psd2 r9 into r10 as field;
    cast r10 r1 r2 r3 r4 r6 r8 into r11 as MerkleTree_4;
    output r11 as MerkleTree_4;


function get_merkle_tree:
    input r0 as [field; 4u32].private;
    call create_merkle_tree r0 into r1;
    output r1 as MerkleTree_4.private;


closure extract_proof:
    input r0 as MerkleTree_4;
    input r1 as u8;
    is.eq r1 0u8 into r2;
    cast r0.hash1 r0.node_l1_2 into r3 as Tuple;
    is.eq r1 1u8 into r4;
    cast r0.hash0 r0.node_l1_2 into r5 as Tuple;
    is.eq r1 2u8 into r6;
    cast r0.hash3 r0.node_l1_1 into r7 as Tuple;
    cast r0.hash2 r0.node_l1_1 into r8 as Tuple;
    not r2 into r9;
    not r4 into r10;
    and r9 r10 into r11;
    and r11 r6 into r12;
    ternary r12 r7.t0 r8.t0 into r13;
    not r2 into r14;
    not r4 into r15;
    and r14 r15 into r16;
    and r16 r6 into r17;
    ternary r17 r7.t1 r8.t1 into r18;
    cast r13 r18 into r19 as Tuple;
    not r2 into r20;
    and r20 r4 into r21;
    ternary r21 r5.t0 r19.t0 into r22;
    not r2 into r23;
    and r23 r4 into r24;
    ternary r24 r5.t1 r19.t1 into r25;
    cast r22 r25 into r26 as Tuple;
    ternary r2 r3.t0 r26.t0 into r27;
    ternary r2 r3.t1 r26.t1 into r28;
    cast r27 r28 into r29 as Tuple;
    output r29 as Tuple;


function get_merkle_proof:
    input r0 as MerkleTree_4.private;
    input r1 as u8.private;
    call extract_proof r0 r1 into r2;
    cast r2.t0 r2.t1 r0.root into r3 as Tuple3;
    output r3 as Tuple3.private;


function verify_merkle_proof:
    input r0 as field.private;
    input r1 as u8.private;
    input r2 as [field; 2u32].private;
    input r3 as field.private;
    hash.psd2 r0 into r4 as field;
    rem r1 2u8 into r5;
    is.eq r5 0u8 into r6;
    cast r4 r2[0u32] into r7 as Tuple;
    hash.psd2 r7 into r8 as field;
    cast r2[0u32] r4 into r9 as Tuple;
    hash.psd2 r9 into r10 as field;
    ternary r6 r8 r10 into r11;
    div r1 2u8 into r12;
    rem r12 2u8 into r13;
    is.eq r13 0u8 into r14;
    cast r11 r2[1u32] into r15 as Tuple;
    hash.psd2 r15 into r16 as field;
    cast r2[1u32] r11 into r17 as Tuple;
    hash.psd2 r17 into r18 as field;
    ternary r14 r16 r18 into r19;
    div r12 2u8 into r20;
    is.eq r19 r3 into r21;
    output r21 as boolean.private;
