# redescription-mining
Frequent Itemset Mining in Redescription Mining

# Indices
- Main thesis: `thesis/main/thesis.tex`
- Proposal: `thesis/proposal`
- pseudo code: `thesis/pseudo codes`

# Experiment setup
We run the redescription mining algorithms (MAS and MAP) with the following base config:
```xml
    <parameter>
        <name>min_itm_in</name>
        <value>850</value>
    </parameter>
    <parameter>
        <name>min_itm_out</name>
        <value>850</value>
    </parameter>
    <parameter>
        <name>min_fin_in</name>
        <value>850</value>
    </parameter>
    <parameter>
        <name>min_fin_out</name>
        <value>850</value>
    </parameter>
    <parameter>
        <name>min_fin_acc</name>
        <value>0.5</value>
    </parameter>
```
For MAS, `max_var_s0` and `max_var_s1` were set like this:
```xml
    <parameter>
        <name>max_var_s0</name>
        <value>4</value>
    </parameter>
    <parameter>
        <name>max_var_s1</name>
        <value>4</value>
    </parameter>
```
For MAP, `max_var_s0` and `max_var_s1` were set like this:
```xml
    <parameter>
        <name>max_var_s0</name>
        <value>2</value>
    </parameter>
    <parameter>
        <name>max_var_s1</name>
        <value>2</value>
    </parameter>
```

From here, we generate a script to run the algorithm using the base config with a varied value of some parameter (e.g. `min_itm_in`) and collect the results for each run.
## target metrics
### candstore_length
The candidate store is populated during the FIM process (ECLAT).
If an itemset is frequent, it will be added to the candidate store. `candstore_length` is the length of the candidate store.
The candidate store is populated during the mining phase.

For MAS (Mine and Split) and FP-Growth, there will be one united candidate store, for MAP(Mine and Pair), there will be 2 sides of candidate stores. 
### no_of_queries
A query is pair of candidates which satisfy the minimum accuracy.
The set of queries is created during the filtering phase.
`no_of_queries` is the length of the list of all queries found by iterating through the candidate store(s).
The `no_of_queries` is expected to equal `no_of_redescriptions`
### no_of_redescriptions
It's the number of redescriptions, which will be returned at the end of the computing expansions process.
### queries_support_min, queries_support_max, queries_support_mean, queries_support_median
Is the minimum/maximum/mean/median number of supports found in the list of calculated redescriptions.
### queries_accuracy_min, queries_accuracy_max, queries_accuracy_mean, queries_accuracy_median
Is the minimum/maximum/mean/median value of accuracy found in the list of calculated redescriptions.
### mining_duration
The duration of the frequent item set mining phase (ECLAT)
### filtering_duration
The duration of the filtering process (iterating the candidate stores and try to find the pairs of candidates which satisfy the requirements).

## x-axis variables
### min_itm_in
This variable is used in the FIM phase, acting as the minimum support to filtering out candidates.
### min_itm_out
This's not being used by any of the FIM or filtering phases.
But I think it's used for candidate generation phase before the two phases above.
### min_fin_in
This field is not being used anywhere and has no impact on the results.
### min_fin_acc
This field is used to limit the lower bound of accuracy (or similarity, or Jaccard's distance) between two pair of candidates.
It's used in the filtering phase.
### max_var_s0, max_var_s1
This defines the maximum size of a frequent itemset (number of terms in a candidate).
Looks like it's also being used to filter candidates in the filter process, however I think it's unnecessary since candidates in this stage has to pass that requirement already. // TODO verify this  
For MAP case `s0` is used for data in the left-hand side, and `s1` for data in the right-hand side.
For MAS, `s0` and `s1` will be added to use as the upper bound for the size of a candidate.

# Observation
## candstore_length
<img src="./thesis-playground/plots-output/candstore_length.png" alt="candstore_length" width="60%">

- FP-Growth tends to have the smallest value among the three => it's because for FPG, the filtering process is stricter, the candstore_length is somewhat similar to the `no_of_redescriptions`
- `min_itm_in`, `min_itm_out` have a strong effect on MAS
- `min_fin_acc` has no effect on MAS and MAP but some effect on FPG, it's expected as MAS and MAP don't use it, and FPG use it. 
- `max_var_s0` and `max_var_s1` has strong effect on MAP

## no_of_queries, no_of_redescriptions
|<img src="./thesis-playground/plots-output/no_of_queries.png" alt="no_of_queries"> | <img src="./thesis-playground/plots-output/no_of_redescriptions.png" alt="no_of_redescriptions"> |
|---|---|
|   |   |

They should be the same?
- MAP and FPG are identical, but MAS isn't, maybe it's because of the `max_var_s0` and `max_var_s1` differences, should run the experiment again for MAS with smaller `max_var`.

=> After running the algorithm again, all the values are equal as expected. 

## queries_support_min, queries_support_max, queries_support_mean, queries_support_median
| <img src="./thesis-playground/plots-output/queries_support_min.png" alt="no_of_redescriptions">  | <img src="./thesis-playground/plots-output/queries_support_max.png" alt="no_of_redescriptions"> |
|--------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| <img src="./thesis-playground/plots-output/queries_support_mean.png" alt="no_of_redescriptions"> | <img src="./thesis-playground/plots-output/queries_support_median.png" alt="no_of_redescriptions"> |

- `queries_support_min`, `queries_support_max` are identical as expected
- `queries_support_mean` and `queries_support_median` are not identical, why?

## queries_accuracy_min, queries_accuracy_max, queries_accuracy_mean, queries_accuracy_median
| <img src="./thesis-playground/plots-output/queries_accuracy_min.png" alt="no_of_redescriptions">  | <img src="./thesis-playground/plots-output/queries_accuracy_max.png" alt="no_of_redescriptions">    |
|---------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| <img src="./thesis-playground/plots-output/queries_accuracy_mean.png" alt="no_of_redescriptions"> | <img src="./thesis-playground/plots-output/queries_accuracy_median.png" alt="no_of_redescriptions"> |

## mining_duration
<img src="./thesis-playground/plots-output/mining_duration.png" alt="mining_duration" width="60%">

- Minidng duration for MAP is much smaller because, this's expected as MAP run on smaller datasets.
- NOTE: For FPG, `mining_duration` and `filtering_duration` are combined
## filtering_duration
<img src="./thesis-playground/plots-output/filtering_duration.png" alt="filtering_duration" width="60%">

- filtering duration for MAS is almost zero because it only need to go through all the frequent-itemsets once and check if one is an acceptable redescription or not.
- NOTE: For FPG, `mining_duration` and `filtering_duration` are combined

## mining_and_filtering_duration
<img src="./thesis-playground/plots-output/mining_and_filtering_duration.png" alt="mining_and_filtering_duration" width="60%">

Sum of mining and filtering duration for comparison with FPG algorithm
- 
