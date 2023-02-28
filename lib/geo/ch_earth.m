
function [Rns, Rew, C_ECEF2ENU, C_ECEF2NED]= ch_earth(lat, lon, h)

%% ���ݾ�γ�ȼ�������ò���
% INPUT
% lat: γ��(rad)
% lon: ����(rad)

% OUTPUT
% Rns, R_meridian(RM, ns)�� �ϱ���������ʰ뾶, ����Ȧ���ʰ뾶(���ŵ�)
% Rew_transverse(RN, ew)��������������ʰ뾶, î��Ȧ���ʰ뾶(���ŵ�)
% C_ECEF2ENU: ECEF��ENUת������
% C_ECEF2NED: ECEF��NEDת������


R0 = 6378137;               %WGS84 ����뾶
e = 0.0818191908425;    %WGS84 eccentricity
% Calculate meridian radius of curvature using (2.105)
temp = 1 - (e * sin(lat))^2;
Rns = R0 * (1 - e^2) / temp^1.5;

% Calculate transverse radius of curvature using (2.105)
Rew = R0 / sqrt(temp);

clat = cos(lat);
slat = sin(lat);
clon = cos(lon);
slon = sin(lon);

C_ECEF2ENU(1,:) =  [-slon ,             clon,                 0];
C_ECEF2ENU(2,:) = [ -slat*clon,    -slat*slon          clat];
C_ECEF2ENU(3,:) = [ clat*clon,      clat*slon,          slat];
           

C_ECEF2NED(1,:) = [-slat*clon,     -slat * slon,       clat];
C_ECEF2NED(2,:) = [-slon,             clon,                    0];
C_ECEF2NED(3,:) = [ -clat*clon,   -clat*slon,        -slat];


end