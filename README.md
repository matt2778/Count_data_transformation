# Count_data_transformation
Log transform and apply normalization to small RNA seq count data

## 4-18-2017_log_transform_Q3_normalization.R

### Function

The 4-18-2017_log_transform_Q3_normalization.R script is a template file for the user to supply file name and working folder location.  The script will output a log2 transformed count file and third quartile normalization factors for each
library.

### Input File

The input file will be a csv count file in the same format as shown below:

`read_name	bln1_t0_rep1	bln1_t0_rep2	bln1_t0_rep3	bln1_t16_rep1`  
`20239_barley_mapped_read_100027-1449	1	6	4	3`  
`20239_barley_mapped_read_100463-1441	0	26	0	35`  
`20239_barley_mapped_read_100673-1437	2	11	4	9`  
`20239_barley_mapped_read_100845-1434	0	0	0	4`  
`20239_barley_mapped_read_100894-1433	12	18	18	21`  
`20239_barley_mapped_read_101055-1430	0	0	2	0`  
`20239_barley_mapped_read_101238-1427	0	3	7	7`  
`20239_barley_mapped_read_101342-1425	0	0	0	0`  

### Output Files

The 4-18-2017_log_transform_Q3_normalization.R script will output two files (named by the user) including a log2 transformed count file and a list of Q3 normalized column factors.

The log2 transformed file will have the output format:

`read_name bln1_t0_rep1	bln1_t0_rep2	bln1_t0_rep3	bln1_t16_rep1`  
`20239_barley_mapped_read_100027-1449	1	2.8073549220576	2.32192809488736	2`  
`20239_barley_mapped_read_100463-1441	1	4.75488750216347	1	5.16992500144231`  
`20239_barley_mapped_read_100673-1437	1.58496250072116	3.58496250072116	2.32192809488736	3.32192809488736`  
`20239_barley_mapped_read_100845-1434	1	1	1	2.32192809488736`  
`20239_barley_mapped_read_100894-1433	3.70043971814109	4.24792751344359	4.24792751344359	4.4594316186373`  
`20239_barley_mapped_read_101055-1430	1	1	1.58496250072116	1`  
`20239_barley_mapped_read_101238-1427	1	2	3	3`  
`20239_barley_mapped_read_101342-1425	1	1	1	1`  

The Q3 normalized column factor file has the following format:

`bln1_t0_rep1	0.617208893851463`  
`bln1_t0_rep2	0.909537309100096`  
`bln1_t0_rep3	0.784772774839784`  
`bln1_t16_rep1	0.91277331396032`  
`bln1_t16_rep2	0.912348500233884`  
`bln1_t16_rep3	0.978926714294505`  

## 4-19-2017_apply_norm_factor.sh

### Function

This script takes the log2 transformed count csv file and a Q3 normalized column factors csv file outputed from 
4-18-2017_log_transform_Q3_normalization.R and outputs a log2 transformed, Q3 normalized small RNA count csv file

This Bash script takes four pieces of information from the user for proper execution:

The first read in $1 is the working folder
The second read in $2 is the count file name
The third read in $3 is normalization factor file name
The forth read in $4 is the output file name

### Output File

The output file for this script will be a log2 transformed, Q3 normalized small RNA count file in csv format


