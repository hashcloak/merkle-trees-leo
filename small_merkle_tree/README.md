# Merkle tree

This is a basic implementation of a Merkle tree with a finite number of leaves, in this case, it has four of them. The program constructs the tree, and also allows to prove if a certain element is in the provided set of items used to construct the tree.

## Test instructions

To create a Merkle tree whose leaves are the elements `1field`, `2field`, `3field`, `4field`, you can use the following command:

```bash
leo run construct_tree 1field 2field 3field 4field
```

To such input, the program will return the following output:

```
{
  h1: 3260460799406925384450789443848721250796883831019095717716089006895746294528field,
  h2: 3736522601382494394255789052466017870786031735005680174691203879959757105441field,
  h3: 3784389418964719981816894781287115017553786961964078707004764868992997308403field,
  h4: 4266717964567714447304234830574206178592409656089100795577037186224161980661field,
  h12: 489244163248477142039291255868606141263270580601922388636762935071998096461field,
  h34: 6606578322613276274823823422133090957027902201306479082468926894187793263543field,
  root: 2053157786202359304312536580760988660248775252721013319879212278153434240177field
}
```

To prove that an element was in the original set, you need to provide the Merkle proof in the following format

```bash
leo run prove_tree <item> <sibling_level_1> <is_l1_left_sibling> <sibling_level_2> <is_l2_left_sibling> <root>
```

Here `<sibling_level_1>` is the hash of the sibling node in the first level of the tree, and `<is_l1_left_sibling>` determines if the provided sibling for the first level is the left or the right sibling in the Merkle tree. The same holds for the sibling in the second level of the tree. The levels are increasing from down to top. 

As an example of the previous command, you can prove that `2field` was in the original set by executing the command

```bash
leo run prove_tree 2field 3260460799406925384450789443848721250796883831019095717716089006895746294528field true 6606578322613276274823823422133090957027902201306479082468926894187793263543field false 2053157786202359304312536580760988660248775252721013319879212278153434240177field
```

In that case, the program returns `true`.