function R = slerp_onR(R1,R2,t)
% slerp working on rotation matrix
% input:
%       R1 : rotation amtrix
%       R2 : rotation amtrix
%       t : interpolation ratio betwon [0, 1]

tol = 1e-3;
one = 1-tol;
q1 = rotm2quat(R1);
q2 = rotm2quat(R2); 

d = dot(q1,q2);
absD = abs(d);
if absD > one
    s0 = 1 - t;
    s1 = t;
else
    theta = acos(absD);
    sinTheta = sin(theta);
    s0 = sin( ( 1 - t ) * theta) / sinTheta;
    s1 = sin( ( t * theta) ) / sinTheta;
end

if d < 0
    s1 = -s1;
end
q = s0*q1 + s1*q2;
R = quat2rotm(q);
end