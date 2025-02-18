% Shannon-Fano Coding 
% Author : Mann Manohar

% Shannon-Fano Coding Script
% This script implements the Shannon-Fano coding algorithm, 
% which is used for lossless data compression.

% Define symbols and their probabilities
symbols = {'A', 'B', 'C', 'D', 'E', 'F'};  % Symbols to encode
probabilities = [0.4, 0.2, 0.2, 0.1, 0.1, 0.1];  % Corresponding probabilities

% Sort symbols based on probabilities in descending order
[probabilities, sortIdx] = sort(probabilities, 'descend'); % Sort probabilities and get sorting indices
symbols = symbols(sortIdx); % Rearrange symbols accordingly

% Generate Shannon-Fano codes
codes = shannon_fano_recursive(probabilities, symbols, '');

% Display results
fprintf('Symbol   Probability   Code\n');
for i = 1:length(symbols)
    fprintf('%s        %.2f          %s\n', symbols{i}, probabilities(i), codes{i});
end

% Recursive function to generate Shannon-Fano codes
function codes = shannon_fano_recursive(probabilities, symbols, prefix)
    codes = cell(size(symbols)); % Initialize an empty cell array to store codes

    % Base case: if only one symbol left, assign the accumulated prefix as its code
    if length(symbols) == 1
        codes{1} = prefix;
        return;
    end

    % Find partition index where the probabilities are nearly equal when split
    total = sum(probabilities); % Total sum of probabilities
    sum1 = 0; % Initialize sum for the first partition
    for splitIdx = 1:length(probabilities)
        sum1 = sum1 + probabilities(splitIdx);
        sum2 = total - sum1; % Remaining sum for second partition
        
        % Stop when the difference between two partitions is minimized
        if abs(sum1 - sum2) < abs((sum1 - probabilities(splitIdx)) - (sum2 + probabilities(splitIdx)))
            break;
        end
    end

    % Recursively compute codes for partitions
    leftCodes = shannon_fano_recursive(probabilities(1:splitIdx), symbols(1:splitIdx), [prefix '0']); % Assign '0' to first partition
    rightCodes = shannon_fano_recursive(probabilities(splitIdx+1:end), symbols(splitIdx+1:end), [prefix '1']); % Assign '1' to second partition

    % Combine the results into the codes array
    codes(1:splitIdx) = leftCodes;
    codes(splitIdx+1:end) = rightCodes;
end
