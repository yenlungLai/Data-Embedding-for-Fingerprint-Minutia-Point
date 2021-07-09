function [x_prime,y_prime] = DE_encode(x,y,b)
%UNTITLED Summary of this function goes here


xmax=max(x,y);
ymin=min(x,y);



h=xmax-ymin;

if h==0 && b==0
        x_prime=xmax;
        y_prime=ymin;
else
  
    x_prime=xmax+floor((b+1)/2);
    y_prime=ymin-floor(b/2);

end
end

