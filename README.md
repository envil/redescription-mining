# redescription-mining
Frequent Itemset Mining in Redescription Mining

# Indices
- Main thesis: `thesis/main/thesis.tex`
- Proposal: `thesis/proposal`
- pseudo code: `thesis/pseudo codes`

# target metrics
### candstore_length
The candidate store is populated during the FIM process (ECLAT).
If an itemset is frequent, it will be added to the candidate store. `candstore_length` is the length of the candidate store.
The candidate store is populated during the mining phase.

For MAS (Mine and Split) and FP-Growth, there will be one united candidate store, for MAP(Mine and Pair), there will be 2 sides of candidate stores. 
### queries_length
A query is pair of candidates which satisfy the minimum accuracy.
The set of queries is created during the filtering phase.
`queries_length` is the length of all found queries found by iterating through the candidate store(s).
### no_of_redescriptions
It's the number of redescriptions/literals, which will be returned at the end of the computing expansions process.
### queries_support_min
Is the minimum number of supports found in the list of calculated redescriptions/literals.
### queries_support_max
Is the maximum number of supports found in the list of calculated redescriptions/literals.
### queries_support_mean
Is the mean of number of supports found in the list of calculated redescriptions/literals.
### queries_support_median
Is the median of number of supports found in the list of calculated redescriptions/literals.
### queries_accuracy_min
Is the minimum value of accuracy found in the list of calculated redescriptions/literals.
### queries_accuracy_max
Is the max value of accuracy found in the list of calculated redescriptions/literals.
### queries_accuracy_mean
Is the mean of value of accuracy found in the list of calculated redescriptions/literals.
### queries_accuracy_median
Is the median of value of accuracy found in the list of calculated redescriptions/literals.
### mining_duration
The duration of the mining process (ECLAT)
### filtering_duration
The duration of the filtering process (iterating the candidate stores and try to find the pairs of candidates which satisfy the requirements).