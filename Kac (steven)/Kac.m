%kac ring model
%values for balls are B=+1 or -1
%marker is active (-1) or not (1)
%markers have internal states M mod Ni
%with Ni even
%activity depends on M mod Ni
%ring has size N
%Nstep time steps

clear
Y=1;
%Y=0 means markers do not change; Y=1 means markers do change
N=20;
Ni=3;
Nstep=100*N^3;
Nplot=800;
%Nstep=1;
%init
for k=1:N
    B(k)=1;
    M(k)=randi(Ni-1)+1;
    Y(k)=0;
end
M0=M;
B0=B;
Bold=B;

count=0;

NM2(1)=length(find(M==2));
NB1(1)=length(find(B==1));

%Y(500)=1;
Y(4)=1;

for n=2:Nstep
    for k=1:N
        kprev=mod(k-2,N)+1;
        B(k)=Bold(kprev)*KacF(M(k));
        M(k)=mod(M(k)+Y(k)*B(k)-1,Ni)+1;
    end
    Bold=B;
    NM2(n)=length(find(M==2));
    NB1(n)=length(find(B==1));
         if (B==B0&M==M0)
            count=count+1;
            I(count)=n-1
        end
end
figure(1)
plot(NB1)

figure(3)
plot(NB1(1:Nplot))

figure(2)
plot(NM2)

for nb=0:max(NB1)
    Omega(nb+1)=length(find(NB1==nb));
    NB(nb+1)=nb;
end

for n=1:min(I)
    S(n)=log(Omega(NB1(n)+1));
end

figure(4)
plot(S)

figure(6)
plot(S(1:Nplot))

figure(5)
plot(NB,Omega,'x')



