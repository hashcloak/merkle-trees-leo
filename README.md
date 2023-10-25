# Merkle trees in Leo

This repository shows three different implementations for Merkle trees in the [Leo programming language](https://developer.aleo.org/leo). This repository arises as an exercise to learn the language basics.

Here, you will find the following implementations:
- `simple_merkle_tree`: this is an implementation of a verifier for Merkle proofs. This implementation uses the `feat/array` branch of the Leo programming language repo.
- `small_merkle_tree`: this is an implementation of a Merkle tree construction and also implements the verification of Merkle proofs for trees with a finite number of leaves. 
- `tiny_merkle_tree`: This is an implementation of a Merkle tree construction for threes with a finite number of leaves. It generates the Merkle proof, and allow the verification of a Merkle proof. This implementation uses the `feat/array` branch of the Leo programming language repo.

## Installation

For the second implementation presented above, you just need to install the Leo programming language following the instructions from the [official documentation](https://developer.aleo.org/leo/installation).

For the first and third implementations, you need to install the version in the [`feat/array` branch](https://github.com/AleoHQ/leo/tree/feat/array) that allows the use of arrays in the programming language. To install such version of the programming language, you need to clone the mentioned branch and follow the installation instructions from [the repository](https://github.com/AleoHQ/leo/tree/feat/array#-build-from-source-code).