function imgSegm = segmenteazaImagine(img,k,optiuneSegmentare)

switch optiuneSegmentare
    case 'intensitate'
        img_gray = rgb2gray(img);    
        intensitati = img_gray(:);
        [C, etichetare] = kmeans_iter(intensitati,k);
        for j=1:size(etichetare,1)
            intensitati(j) = uint8(C(etichetare(j)));
        end    
        imgSegm = reshape(intensitati,size(img_gray,1),size(img_gray,2));    
        figure, 
        subplot(1,2,1);imshow(img);title('Imaginea initiala');
        subplot(1,2,2);imshow(imgSegm,[]); title(['Segmentare pe baza de intensitate, K=' num2str(k)]);
        figure, imshow(imgSegm);        
        
    case 'culoare'
       
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
data = double([R(:) G(:) B(:)]);
%[C, etichetare] = kmeans_iter(data, k);
[etichetare, C] = kmeans(data, k);
for j=1:size(etichetare,1)
data(j, :) = uint8(C(etichetare(j), :));
end
rSeg = data(:,1);
gSeg = data(:,2);
bSeg = data(:,3);
rSeg = reshape(rSeg, size(R,1),size(R,2));
gSeg = reshape(gSeg, size(R,1),size(R,2));
bSeg = reshape(bSeg, size(R,1),size(R,2));
imgSegm = img;
imgSegm(:,:,1) = rSeg;
imgSegm(:,:,2) = gSeg;
imgSegm(:,:,3) = bSeg;
figure, 
subplot(1,2,1);imshow(img);title('Imaginea initiala');
subplot(1,2,2);imshow(imgSegm,[]); title(['Segmentare pe baza de intensitate, K=' num2str(k)]);
figure, imshow(imgSegm);
        
    case 'intensitate+pozitie'
        
    
        
    case 'culoare+pozitie'
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);
        ctr = 0;
        for y = 1:size(img,2)
            for x = 1:size(img,1)
                    ctr= ctr+1;
                    poz(ctr,:) = [y x];
            end
        end
        data = double([R(:) G(:) B(:) poz(:,1) poz(:,2)]);
        [etichetare,C] = kmeans(data,k);
        for j=1:size(etichetare,1)
            data(j, :) = uint8(C(etichetare(j), :));
        end
        rSeg = data(:,1);
gSeg = data(:,2);
bSeg = data(:,3);
rSeg = reshape(rSeg, size(R,1),size(R,2));
gSeg = reshape(gSeg, size(R,1),size(R,2));
bSeg = reshape(bSeg, size(R,1),size(R,2));
imgSegm = img;
imgSegm(:,:,1) = rSeg;
imgSegm(:,:,2) = gSeg;
imgSegm(:,:,3) = bSeg;
figure, 
subplot(1,2,1);imshow(img);title('Imaginea initiala');
subplot(1,2,2);imshow(imgSegm,[]); title(['Segmentare pe baza de intensitate, K=' num2str(k)]);
figure, imshow(imgSegm);
        
    otherwise
        error('optiuneSegmentare invalida');
end
