function [y] = durbin(r)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a = r(1);
r = r/a;
r = r(2:end,:);
y = [r(1)];
beta = 1;
alpha = r(1);
n = size(r,1);
for k= 1:n-1
    beta = (1-alpha^2)*beta;
    alpha = (r(k+1)-r(1:k)'*y(k:-1:1))/beta;
    z = y - alpha*y(k:-1:1);
    y = [z ; alpha];
end