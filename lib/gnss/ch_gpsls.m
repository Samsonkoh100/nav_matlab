function [X, dx, G] = ch_gpsls(X,  sat_pos,  pr)
% GPS α����С���˷���⣬ ״̬��Ϊ X Y Z B(�Ӳ�)
% X: X ֵ(1:3) λ��delta, (4) �û��Ӳ�ƫ��
% G: ��ƾ���
% pr: У�����α��
% sat_pos: ����λ�þ���
% delta: delta ֵ(1:3) λ��delta, (4) �û��Ӳ�ƫ��

B1=1;
END_LOOP=100;
%���Ǹ���
n = size(sat_pos, 2);

if n < 4
    dx = 0;
    G = 0;
    return
end

    for loop = 1:10
        % ��õ�ǰλ���������վ�ľ���
        r = vecnorm(sat_pos - X(1:3));
        
        % ���H����
        H = (sat_pos - X(1:3)) ./ r;
        H =-H';
        
        H = [H(:,1:3),  ones(n,1)];
        
        dp = ((pr - r) -  X(4))';
        
        % �����û�����
        dx =  (H'*H)^(-1)*H'*dp;
        X = X + dx;
        G = H;
        
    %    END_LOOP = vnorm(delta(1:3));
    end
    
    
end


