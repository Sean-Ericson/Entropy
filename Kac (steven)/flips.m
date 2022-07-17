function r=flips(m,n);
if (m==1)
    z=[4,3,2,1];
elseif (m==0)
    z=[1,2,3,4];
else
    z=[2,1,4,3];
end
r=z(n);

end