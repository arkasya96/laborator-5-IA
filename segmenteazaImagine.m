function imgSegm = segmenteazaImagine(img,k,optiuneSegmentare)

switch optiuneSegmentare
    case 'intensitate'
        img_gray = rgb2gray(img);    
        intensitati = img_gray(:);
        [C, etichetare] = kmeans_iter(intensitati,k,80);
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
        B = img (:,:,3);
        rgbvector = [R(:) G(:) B(:)];
        [C,etichetare] = kmeans_iter(rgbvector, k,80);
        
         for j=1:size(etichetare,1)
            rgbvector(j,:) = uint8(C(etichetare(j),:));
        end    
        imgSegm = reshape(rgbvector,size(img,1),size(img,2),size(img,3));    
        figure, 
        subplot(1,2,1);imshow(img);title('Imaginea initiala');
        subplot(1,2,2);imshow(imgSegm,[]); title(['Segmentare pe baza de intensitate, K=' num2str(k)]);
        figure, imshow(imgSegm);        
        
    case 'intensitate+pozitie'
        img_gray = rgb2gray(img);
        
        [i,j] = ind2sub([size(img,1),size(img,2)], 1:size(img,1)*size(img,2));
        
        [C, etichetare] = kmeans_iter([img_gray(:),i(:),j(:)],k,80);
        for j=1:size(etichetare,1)
            intensitati1(j) = uint8(C(etichetare(j),1));
        end
        imgSegm = reshape(intensitati1,size(img_gray,1),size(img_gray,2));
        figure,
        subplot(1,2,1);imshow(img);title('Imaginea initiala');
        subplot(1,2,2);imshow(imgSegm,[]); title(['Segmentare pe baza de intensitate, K=' num2str(k)]);
        figure, imshow(imgSegm);
    case 'culoare+pozitie'
        
    otherwise
        error('optiuneSegmentare invalida');
end