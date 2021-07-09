function [x_return,y_return,b_return] = DE_decode(xprime,yprime)


xmax=max(xprime,yprime);
ymin=min(xprime,yprime);


b_return=xmax-ymin;

    x_return=xmax-floor(((b_return)+1)/2);
    y_return=ymin+floor((b_return)/2);

end

