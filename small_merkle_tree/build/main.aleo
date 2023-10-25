program merkle_tree.aleo;

struct FieldTuple:
    left as field;
    right as field;

struct MerkleTree:
    h1 as field;
    h2 as field;
    h3 as field;
    h4 as field;
    h12 as field;
    h34 as field;
    root as field;


function construct_tree:
    input r0 as field.private;
    input r1 as field.private;
    input r2 as field.private;
    input r3 as field.private;
    hash.bhp256 r0 into r4 as field;
    hash.bhp256 r1 into r5 as field;
    hash.bhp256 r2 into r6 as field;
    hash.bhp256 r3 into r7 as field;
    cast r4 r5 into r8 as FieldTuple;
    hash.bhp256 r8 into r9 as field;
    cast r6 r7 into r10 as FieldTuple;
    hash.bhp256 r10 into r11 as field;
    cast r9 r11 into r12 as FieldTuple;
    hash.bhp256 r12 into r13 as field;
    cast r4 r5 r6 r7 r9 r11 r13 into r14 as MerkleTree;
    output r14 as MerkleTree.private;


function prove_tree:
    input r0 as field.private;
    input r1 as field.private;
    input r2 as boolean.private;
    input r3 as field.private;
    input r4 as boolean.private;
    input r5 as field.private;
    hash.bhp256 r0 into r6 as field;
    is.eq r2 true into r7;
    cast r1 r6 into r8 as FieldTuple;
    hash.bhp256 r8 into r9 as field;
    cast r6 r1 into r10 as FieldTuple;
    hash.bhp256 r10 into r11 as field;
    ternary r7 r9 r11 into r12;
    is.eq r4 true into r13;
    cast r3 r12 into r14 as FieldTuple;
    hash.bhp256 r14 into r15 as field;
    cast r12 r3 into r16 as FieldTuple;
    hash.bhp256 r16 into r17 as field;
    ternary r13 r15 r17 into r18;
    is.eq r5 r18 into r19;
    output r19 as boolean.private;
