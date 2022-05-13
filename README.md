These scripts contain the Ancestree integer linear programming (ILP) algorithm implementation for noise-free instances (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4542783/).
It's written in R and python and needs CPLEX to be installed to be run.

## DOWNLOAD

You can download the program as follows:
```
git clone https://github.com/mmaitenat/ancestree_ILP.git
```

## USAGE

The program needs no installation and can be run (from the folder) simply as follows:
```
chmod a+x runAncestreeILP.sh
./runAncestreeILP.sh F.txt
```

## EXAMPLE

A sample F matrix is provided in data/F.txt. The output of the program for this example is the following:
```
Version identifier: 12.10.0.0 | 2019-11-27 | 843d4de
CPXPARAM_Read_DataCheck                          1
CPXPARAM_RandomSeed                              201903125
Found incumbent of value 1.000000 after 0.00 sec. (0.00 ticks)
Tried aggregator 1 time.
MIP Presolve eliminated 46 rows and 4 columns.
MIP Presolve modified 80 coefficients.
Reduced MIP has 25 rows, 26 columns, and 94 nonzeros.
Reduced MIP has 26 binaries, 0 generals, 0 SOSs, and 0 indicators.
Presolve time = 0.00 sec. (0.15 ticks)
Probing time = 0.00 sec. (0.03 ticks)
Tried aggregator 2 times.
Detecting symmetries...
MIP Presolve eliminated 1 rows and 0 columns.
Aggregator did 1 substitutions.
Reduced MIP has 23 rows, 24 columns, and 90 nonzeros.
Reduced MIP has 24 binaries, 0 generals, 0 SOSs, and 0 indicators.
Presolve time = 0.00 sec. (0.10 ticks)
Probing time = 0.00 sec. (0.03 ticks)
Clique table members: 73.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 8 threads.
Root relaxation solution time = 0.00 sec. (0.03 ticks)

        Nodes                                         Cuts/
   Node  Left     Objective  IInf  Best Integer    Best Bound    ItCnt     Gap

*     0+    0                            1.0000       26.0000              --- 
*     0+    0                            2.0000       26.0000              --- 
*     0+    0                            3.0000       26.0000           766.67%
*     0     0      integral     0       10.0000       10.0000        9    0.00%
Elapsed time = 0.00 sec. (0.42 ticks, tree = 0.00 MB, solutions = 4)

Root node processing (before b&c):
  Real time             =    0.00 sec. (0.42 ticks)
Parallel b&c, 8 threads:
  Real time             =    0.00 sec. (0.00 ticks)
  Sync time (average)   =    0.00 sec.
  Wait time (average)   =    0.00 sec.
                          ------------
Total (root+branch&cut) =    0.00 sec. (0.42 ticks)
solution for: Ancestree
objective: 10
x_0_5=1
x_5_1=1
x_2_4=1
x_5_2=1
x_5_3=1
x_4_6=1
x_5_7=1
x_5_9=1
x_5_10=1
x_6_8=1
```


## Contact

Maitena Tellaetxe Abete - maitenat@gmail.com

