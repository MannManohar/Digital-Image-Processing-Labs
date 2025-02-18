





## Bit Plane Slicing

Author Name: Mann Manohar



## Description: 



The Shannon-Fano Coding script is a MATLAB implementation of the Shannon-Fano coding algorithm, a lossless data compression technique. This algorithm assigns shorter codes to more frequently occurring symbols and longer codes to less frequent ones, optimizing data representation.

The script takes a set of symbols with their corresponding probabilities, sorts them in descending order, and applies recursive Shannon-Fano coding to generate unique binary codes for each symbol.



## Features

- Symbol Probability-Based Encoding: Takes a predefined set of symbols and their corresponding probabilities as input. Sorts symbols based on their probabilities in descending order for efficient encoding.
- Recursive Shannon-Fano Algorithm: Splits symbols into two groups with nearly equal probability sums. Assigns binary codes recursively to each partition.
- Clear and Organized Output: Displays symbols, their probabilities, and their respective Shannon-Fano codes in a tabular format.





## How to run

1. Open the MATLAB environment.

2. Save the script as ShannonFanoCoding.m.

3. Run the script.

4. The output will display each symbol, its probability, and the corresponding Shannon-Fano code.

## Example Output

Symbol   Probability  Code  
A        0.40         0  
B        0.20         10  
C        0.20         11  
D        0.10         100  
E        0.10         101  
F        0.10         110  





## Notes

- The script assumes predefined symbols and probabilities. Modify them as needed.

- The algorithm recursively partitions symbols to generate optimal codes.

- The output binary codes are unique and prefix-free, ensuring lossless compression.

- The script automatically sorts symbols in descending probability order before encoding.


