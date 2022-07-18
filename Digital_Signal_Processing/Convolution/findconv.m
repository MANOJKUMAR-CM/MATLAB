function [y,ny]=findconv(x,nx,h,nh)
    nybegin=nx(1)+nh(1);
    nyend=nx(length(nx))+nh(length(nh));
    ny=nybegin:nyend;
    y=conv(x,h);
    y=calcconv(x,h);
end

