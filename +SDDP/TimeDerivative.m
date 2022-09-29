function df = TimeDerivative(f, q, varargin)
%TimeDerivative Calculate the time derivative of the function f.
%
% The first argument define the f, which is a function of q.
%
% The second argument define the vairbale.
%
% The following argument define the form of all-order derivaives which will
% be returen.
%
% Demo:
%
% import SDDP.TimeDerivative
% q = sym("q", [1,2]);
% w = sym("w", [1,2]);
% a = sym("a", [1,2]);
% f = 0.5*sum(q.^2);
% df = TimeDerivative(f, q, w, a);

order = length(varargin);


syms t real;
for k = 1:length(q)
    qt(k) = str2sym(string(q(k))+"t(t)");
    assume(qt(k), 'real');
end

for k = 1:order
    dq{k} = varargin{k};
    dqt{k} = diff(qt, t, k);
end

ft = subs(f, q, qt);
dft = diff(ft, t, order);
df = dft;
for k = order:-1:1
    df = subs(df, dqt{k}, dq{k});
end


df = subs(df, qt, q);


end