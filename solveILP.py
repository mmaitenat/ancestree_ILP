from docplex.mp.model import Model
import numpy as np
import pandas as pd
import sys

ancestry_graph_filename = sys.argv[1]
F_filename = sys.argv[2]

with open(ancestry_graph_filename) as f:
    A_ext = [tuple(i.strip().split(' ')) for i in f]

A = [arc for arc in A_ext if arc[0] != "0"] 

F = pd.read_csv(F_filename, sep=" ", header = None)
m = len(F)
n = F.shape[1]
N = [str(i) for i in range(1, n+1)]
V = ["0"] + N

F.columns = N


mdl = Model('Ancestree')
x = mdl.binary_var_dict(A_ext, name='x')
mdl.maximize(mdl.sum(x[i, j] for i, j in A_ext))
mdl.add(mdl.sum(x[i, j] for i, j in A_ext if i == "0") == 1) # one root vertex
mdl.add_constraints(x[k,l] <= mdl.sum(x[j, k] for j in V if (j, k) in A_ext) for k, l in A) # every outcoming has incoming
mdl.add_constraints(mdl.sum(x[j, k] for j in V if (j, k) in A_ext) <= 1 for k in N) # one incoming arc only
# sum conditions:
for sample in range(m):
    mdl.add_constraints(mdl.sum(F.iloc[sample, int(l)-1]*x[k, l] for l in V if (k, l) in A_ext) <=  mdl.sum(F.iloc[sample, int(k)-1]*x[j, k] for j in V if (j, k) in A_ext) for k in N)

solution = mdl.solve(log_output=True)
print(solution)