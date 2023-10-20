program simple_merkle_tree.aleo;





function main:
    input r0 as field.public;
    cast 1field1field1field1field into r1 as [field; 4u32];
    hash.psd2 1field into r2 as field;
    and 1u8 1u8 into r3;
    is.eq r3 1u8 into r4;
    mul r2 r1[0u32] into r5;
    mul r5 3field into r6;
    hash.psd2 r6 into r7 as field;
    mul r2 r1[0u32] into r8;
    mul r8 2field into r9;
    hash.psd2 r9 into r10 as field;
    ternary r4 r6 r9 into r11;
    ternary r4 r7 r10 into r12;
    div 1u8 2u8 into r13;
    and r13 1u8 into r14;
    is.eq r14 1u8 into r15;
    mul r12 r1[1u32] into r16;
    mul r16 3field into r17;
    hash.psd2 r17 into r18 as field;
    mul r12 r1[1u32] into r19;
    mul r19 2field into r20;
    hash.psd2 r20 into r21 as field;
    ternary r15 r17 r20 into r22;
    ternary r15 r18 r21 into r23;
    div r13 2u8 into r24;
    and r24 1u8 into r25;
    is.eq r25 1u8 into r26;
    mul r23 r1[2u32] into r27;
    mul r27 3field into r28;
    hash.psd2 r28 into r29 as field;
    mul r23 r1[2u32] into r30;
    mul r30 2field into r31;
    hash.psd2 r31 into r32 as field;
    ternary r26 r28 r31 into r33;
    ternary r26 r29 r32 into r34;
    div r24 2u8 into r35;
    and r35 1u8 into r36;
    is.eq r36 1u8 into r37;
    mul r34 r1[3u32] into r38;
    mul r38 3field into r39;
    hash.psd2 r39 into r40 as field;
    mul r34 r1[3u32] into r41;
    mul r41 2field into r42;
    hash.psd2 r42 into r43 as field;
    ternary r37 r39 r42 into r44;
    ternary r37 r40 r43 into r45;
    div r35 2u8 into r46;
    is.eq r45 1field into r47;
    output r47 as boolean.private;
