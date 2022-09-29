clear
clc
import SDDP.*;

q = sym("q", [1,2]);
dq = sym("dq", [1,2]);
ddq = sym("ddq", [1,2]);
f = 0.5*sum(q.^2);
df = TimeDerivative(f, q, dq);
f
df
