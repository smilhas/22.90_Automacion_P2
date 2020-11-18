function hist=histograma(im)
nm=size(im);
hist=zeros(1,255);

for i=1:nm(1)
    for j=1:nm(2)
        hist(im(i,j))=hist(im(i,j))+1;
    end
end
end
