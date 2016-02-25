# haskell_search

### Compiling
Run the following
```
$ ghc test.hs
```

### Running
```
$ ./test
```

### Testing
A couple things to note about testing this program.
- The benefit of using a statically typed language is that I get to experience the frustrations of handling types, which alleviates a lot of errors that would normally have to be handled in a dynamically typed language.
- The benefit of using a functional language is that by not allowing for state mutations within each function, testing idempotency seems unnecessary...
- If you see my [commit](https://github.com/Kartstig/haskell_search/commit/536511acd1c96792b465c572670e4f66dbabe171) about the equals case for <= and >= tests, I had to fix a bug where it was returning Exact where it wasn't actually an exact match. Although I picked up on this bug from doing manual tests, an ideal bit of test code would include something that takes the return index and compares the array value at the given index against the key with the intended equality test (==, <, >). These should be compared at all ranges of the equality test. Because the test cases will be very similar, my test plan is generic enough to apply to all the equality functions.

#### Test Plan Example for LESS THAN EQUAL:
- Given: Any Array, A Key that is less than all values in the array. Then the result should be NotFound. Then the index should be X.
- Given: Any Array, A Key that is equal to one of the values in the array. Then the result should be FoundExact. Then the result index should be equal to the the value in the array that matches the key.
- Given: Any Array, A Key that is not equal to any values in the array, but greater than the lowest value, and less than the maximum vaulue. Then the result should FoundLess. Then the index should be an index which matches the largest value that is less than the key
- Given: Any Array, A Key that is greater than all values in the array. Then the result should be FoundLess. Then the index should be the last index of the array

I chose this example because it includes all the possible test cases. The test cases are almost identical for the other methods, except some can be omitted for the LESS THAN, GREATER THAN, and EQUALS functions.
