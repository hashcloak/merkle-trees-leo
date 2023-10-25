# Simple Merkle Tree in Leo

This is a simple implementation of a Merkle tree with 16 leaves in Leo and the verification of a Merkle proof of such tree. 

With this implementation you can verify a Merkle proof and generate testvalues to do so. Specifically there are the following functions (transitions) to call:
- `verify_merkle_proof`, this will verify the Merkle proof for a leaf and corresponding leaf index
- `get_test_values`, this will allow you to generate a Merkle proof to test the previous function with. It requires the 16 leaves of the tree and the leaf index

## Build Guide

To compile this Leo program, run:
```bash
leo run main
```

To execute this Leo program, run:
```bash
leo execute main
```

## Test

### Full example 1

First, obtain the Merkle proof for leaf with index 0:
```bash
leo run get_test_values "[3field, 6field, 1field, 9field, 10field, 4field, 12field, 7field,11field, 18field, 2field, 14field, 16field, 5field, 21field, 8field]" 0u8

# Result:
# [
#   7957869376402427458414391427827994393570004362503155705352209248862077308098field,
#   2480189107576283157302673498822341376328169812325058987418755627238677989670field,
#   7950969757923462032667885953525950845890534705463939620143798308942178681873field,
#   976616165890079520862580248121283248579046031400063910557751897509090993636field,
#   4654350840935681996930376444799659911081513548469969762510431108283297160887field
# ]
```

This returns the 4 elements of the Merkle proof and the root. 

Verify Merkle proof. Input:
- the leaf
- the leaf index
- the first 4 elements of previous step in an array
- the last element of previous step
```bash
leo run verify_merkle_proof 3field 0u8 "[7957869376402427458414391427827994393570004362503155705352209248862077308098field,
  2480189107576283157302673498822341376328169812325058987418755627238677989670field,
  7950969757923462032667885953525950845890534705463939620143798308942178681873field,
  976616165890079520862580248121283248579046031400063910557751897509090993636field]" 4654350840935681996930376444799659911081513548469969762510431108283297160887field

  # true - Merkle proof verified
```

Example of what should output false: (wrong leaf index)
```bash
leo run verify_merkle_proof 3field 1u8 "[7957869376402427458414391427827994393570004362503155705352209248862077308098field,
  2480189107576283157302673498822341376328169812325058987418755627238677989670field,
  7950969757923462032667885953525950845890534705463939620143798308942178681873field,
  976616165890079520862580248121283248579046031400063910557751897509090993636field]" 4654350840935681996930376444799659911081513548469969762510431108283297160887field
```