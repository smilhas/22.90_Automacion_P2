function vermovimiento(vid)
vid.skiptoframe(1)
bg=vid.grab();

while 1
    im=vid.grab;
    if isempty(im),break;end
    
    idisp(im-bg,'signed'); drawnow
    bg=im;
end
end
