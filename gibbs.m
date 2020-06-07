R= [5887 -3520 -1204];   %[km]

eps = 1.e-10;
r = norm(R);
v = norm(V);
vr = dot(R,V)/r;
H = cross(R,V);
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
E = 1/mu*((v^2 - mu/r)*R - r*vr*V);
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
    theta = acos(dot(E,R)/e/r); 
    if vr < 0 
        theta = 2*pi - theta; 
    end
else
    cp = cross(N,R);
    if cp(3) >= 0
        theta = acos(dot(N,R)/n/r);
    else
        theta = 2*pi - acos(dot(N,R)/n/r);
    end
end
a = h^2/mu/(1 - e^2);
coe = [h e RAAN incl omega theta a]