function [C, etichetare] = kmeans_initial(X, K)
%input:  X = N x d, X contine pe fiecare linie un vector de caracteristici, de dimensiune d
%        X contine in total N puncte d-dimensionale
%        K = numarul de clusteri
%output: C = contine clusterii, o matrice K x d, fiecare linie contine un cluster de dimensiune d
%        etichetare = vector coloana N x 1, care specifica carui cluster apartine fiecare punct din X

X = double(X);
[N, d] = size(X);

%Initializam centri clusterilor = puncte din X alese aleator diferite
permutare = randperm(N);
C = X(permutare(1:K),:);

%etichetare initiala
etichetare = zeros(N, 1);

%algoritmul iterativ propriu-zis
while true
    % determina apartenenta fiecarui punct din X la un cluster
    etichetareOptima = zeros(N, 1);
    distantaMinima = Inf*ones(N, 1);
    for k = 1:K
        for n = 1:N
            %distanta Euclidiana
            distanta = sum((X(n, :)-C(k, :)).^2);
            if distanta < distantaMinima(n)
                distantaMinima(n) = distanta;
                etichetareOptima(n) = k;
            end
        end
    end
    
    % iesi din while daca nu s-au schimbat centri
    if all(etichetareOptima==etichetare)
        break;
    end;
    
    %determina centri noilor clusteri pe baza punctelor
    for k = 1:K
        C(k, :) = mean(X(etichetareOptima==k, :));
    end
    
    etichetare = etichetareOptima;
end