r1 = 500;
r0 = 406;
inclination_required=7.0410;



del_r = r1 - r0;
while del_r == r1 - r0
    if (360> inclination_required) && (inclination_required > 0) && (inclination_required ~= 180)
        if del_r > 0
            thruster_fired = ("Prograde"); 
        elseif del_r < 0
            thruster_fired = ("Retrograde");
        else 
            thruster_fired = ("null");
        end
%        timedelay = time_taken;
%        if (360 == inclination_required) && (inclination_required == 0) && (inclination_required == 180)
%             timedelay = 0;
%        end
    end
    transfer_v = 1000*dv1; 
    breaking_v = 1000*dv2;
    break 
    if del_r == 0
    end
end 



    




      
        
     