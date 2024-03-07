A = [20, -27, 7;
     53, -63, 13;
     -5, 12, -8];
B = [1, -1;
    -2, -1;
    -3, 0];
C = [0, 0, -2;
     1, -1, -1];
D = [0, 0;
     0, 0];

eps = 1e-5;
gamma_l=1e-2; 
gamma_h=10;

while( abs(gamma_l-gamma_h)> eps )
    gamma=(gamma_l+gamma_h)/2;
    H=[A  ,(1/gamma^2)*(B*B') ;
          -C'*C ,   -A'];
    H=vpa(H,4);
    flag=judge(H);
    if(flag)  
        gamma_l=gamma;
    else
        gamma_h=gamma;
    end
end

inf_norm_brl = gamma;
disp("inf norm = ");
disp(inf_norm_brl)

function flag=judge(H)
    flag=0;
    [~,d]=eig(H); 
    d=vpa(d,4);
    for i=1:max(size(H))
        if(real(d(i,i))==0) 
            flag=1;
            break;
        end
    end
end