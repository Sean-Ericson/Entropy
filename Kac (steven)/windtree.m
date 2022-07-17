Nx=10;
Ny=10;
Ntrees=15;
Nwind=10;
Nsteps=100;
tree=zeros(Nx,Ny);
wind=tree;
for k=1:Ntrees
    tree(randi(Nx),randi(Ny))=randi(2);
end
for k=1:Nwind
    Wx(k)=randi(Nx);
    Wy(k)=randi(Ny);
    Wtype(k)=randi(4);
    wind(Wx(k),Wy(k))=Wtype(k);
end

tree0=tree;
wind0=wind;

for n=1:Nsteps

for k=1:Nwind
    T=tree(Wx(k),Wy(k));
    wt=flips(T,Wtype(k));
    Wtype(k)=wt;
    Wx(k)=mod(Wx(k)+fx(wt)-1,Nx)+1;
    Wy(k)=mod(Wy(k)+fy(wt)-1,Ny)+1;
    X(k,n)=Wx(k);
    Y(k,n)=Wy(k);
    Ty(k,n)=wt;
end

end