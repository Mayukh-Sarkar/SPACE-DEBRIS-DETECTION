mu = 398600;               %[km^3/s^2] Earth’s gravitational parameter

R1 = [6788 0 0];   %[km]
R2 = [0 1 0 ];   %[km]
R3 = [0 0 1];   %[km]

r1 = norm(R1); r2 = norm(R2); r3 = norm(R3);
% Vector cross products
R12 = cross(R1,R2);
R23 = cross(R2,R3);
R31 = cross(R3,R1);

Nv  = r1*R23 + r2*R31 + r3*R12;
Dv  = R23 + R31 + R12;
Sv  = (r2-r3)*R1 + (r3-r1)*R2 + (r1-r2)*R3;

N   = norm(Nv);
D   = norm(Dv);

V1 = (mu/(N*D))^0.5*(cross(Dv,R1)/r1 + Sv);
eps = 1.e-10;
r = norm(R1);
v = norm(V1);
vr = dot(R1,V1)/r;
H = cross(R1,V1);
h = norm(H);

incl = acos(H(3)/h);
N = cross([0 0 1],H);
n = norm(N);
if n ~=0
    RAAN = acos(N(1)/n); 
    if N(2) < 0 
        RAAN = 2*pi - RAAN;
    end
else
    RAAN = 0;
end
E = 1/mu*((v^2 - mu/r)*R1 - r*vr*V1);
e = norm(E);
if n ~=0 
    if e > eps 
        omega = acos(dot(N,E)/n/e);
        if E(3) < 0 
            omega = 2*pi - omega;
        end
    else
        omega = 0;
    end
else
    omega = 0;
end
if e > eps
    theta = acos(dot(E,R1)/e/r); 
    if vr < 0 
        theta = 2*pi - theta; 
    end
else
    cp = cross(N,R1);
    if cp(3) >= 0
        theta = acos(dot(N,R1)/n/r);
    else
        theta = 2*pi - acos(dot(N,R1)/n/r);
    end
end
a = h^2/mu/(1 - e^2);
apogee = a*(1+e);
perigee = a*(1-e);
coe = [h e RAAN incl omega theta a]

