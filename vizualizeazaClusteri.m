function vizualizeazaClusteri(k)

%incarcam puncte din fisierul puncte2D.mat
temp = load('../data/puncte2D.mat');
data = temp.P;
clear t;

optiuniPlotare = {'rx','b+','g*','cd','mv','kp','rh','bx','g+','cv'};
figure,
%afisam toate punctele cu aceeasi culoare + acelasi marker
plot(data(:,1),data(:,2),optiuniPlotare{1});title('Plotare puncte');

%completati codul Matlab in continuare
%aplicati algoritmul kmeans pt data cu nr de clusteri k
img = imread('C:\Users\ini\Desktop\I.A\Laborator5\data\pesti.jpg');
imgSegmentata = segmenteazaImagine(img,k,'intensitate+pozitie');
%afisati fiecare punct cu o culoare corespunzatoare pentru fiecarui cluster


%afisati centrul clusterului cu markerul o