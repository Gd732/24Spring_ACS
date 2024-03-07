s = tf('s');
gs = (s - 1)/(s^2 + 2*s + 10);
[A, B, C, D] = ssdata(gs);

eps = 1e-5;
gamma_l=1e-2; 
gamma_h=10;

while( abs(gamma_l-gamma_h)> eps )
    gamma=(gamma_l+gamma_h)/2;
    H=[A  ,(1/gamma^2)*(B*B') ;
          -C'*C ,   -A']  ;
    H=vpa(H,4);
    flag=judge(H);
    if(flag)  
        gamma_l=gamma;
    else
        gamma_h=gamma;
    end
end

inf_norm = gamma;
disp("Inf norm =");
disp(inf_norm);

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