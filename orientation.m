%% initial orientation 0 deg

fprintf('\n required inclination \n'); %required inclination

 inclination_required = input('?');
 fprintf('\n length  of the spacecraft arm \n') 

length = input('?'); %lenght in meters
fprintf('\n velocity of manuever per impulse\n')
manuever_rate = input('?'); % unit in ft/sec

horizontal_maneuver = 0;
theta_y = 0;
vertical_maneuver = 0;
acheived_inclination =0;   % init from zero , acheives the value of inclination
theta_1 = [];
pos =1;
theta_1 =0;
pos2 = 1;
%% Calculating for theta
 if  (90 > inclination_required)  && (inclination_required> 0)  
    while (abs(acheived_inclination-inclination_required)*100/inclination_required) > 1   
         for horizontal_maneuver = horizontal_maneuver+0.00001   %orientation in horizontal direction in angles    
         for vertical_maneuver = vertical_maneuver +0.000015  %orientation in horizontal direction in angles 
            acheived_inclination = sqrt(horizontal_maneuver^2 + vertical_maneuver^2);
            theta_1(pos2) = acheived_inclination;
            pos2 = pos2+1;

          end
         end
        if inclination_required == acheived_inclination      
    break 
        end


    end
 end
if (180 > inclination_required)  && (inclination_required> 90)
     while (abs(acheived_inclination-inclination_required)*100/inclination_required) > 1  
         for horizontal_maneuver = horizontal_maneuver-0.000011   %orientation in horizontal direction in angles    
         for vertical_maneuver = vertical_maneuver +0.000015  %orientation in horizontal direction in angles 
            acheived_inclination = sqrt(horizontal_maneuver^2 + vertical_maneuver^2);
            theta_1(pos2) = acheived_inclination;
            pos2 = pos2+1;

          end
         end
        if inclination_required == acheived_inclination      
    break 
        end


     end
end  %(abs(theta-k)*100/k) > 1 
if (270 > inclination_required)  && (inclination_required> 180)
     while (abs(acheived_inclination-inclination_required)*100/inclination_required) > 1 
         for horizontal_maneuver = horizontal_maneuver-0.0001   %orientation in horizontal direction in angles    
         for vertical_maneuver = vertical_maneuver -0.00015  %orientation in horizontal direction in angles 
            acheived_inclination = sqrt(horizontal_maneuver^2 + vertical_maneuver^2);
            theta_1(pos2) = acheived_inclination;
            pos2 = pos2+1;

          end
         end
        if inclination_required == acheived_inclination      
    break 
        end


     end
end
if (360 > inclination_required)  && (inclination_required>  270)
     while (abs(acheived_inclination-inclination_required)*100/inclination_required) > 1  
         for horizontal_maneuver = horizontal_maneuver+0.000011   %orientation in horizontal direction in angles    
         for vertical_maneuver = vertical_maneuver -0.000015  %orientation in horizontal direction in angles 
            acheived_inclination = sqrt(horizontal_maneuver^2 + vertical_maneuver^2);
            theta_1(pos2) = acheived_inclination;
            pos2 = pos2+1;

          end
         end
        if inclination_required == acheived_inclination      
    break 
        end


     end
end
     
%% Calculation for time


r = length*1*(pi/180);  % Distance moved per degree rotation(arc length)
arm_vel = manuever_rate*0.305; % Arm_Velocity
per_deg_time = r/arm_vel; 
time_maneuver = theta_1.*per_deg_time;
plot(time_maneuver,theta_1)

%% firing sequence
if inclination_required < 90
    Sequence_one_RCS_thrusters_fired=  [3 ; 4 ;5; 6] ;
    Sequence_two_RCS_thrusters_fired=  [1 ; 2 ;8; 7] ; 
end
if (180 > inclination_required)  && (inclination_required> 90)
    Sequence_one_RCS_thrusters_fired=  [1 ; 4 ;7; 6 ];
    Sequence_two_RCS_thrusters_fired=  [2 ; 3 ;5; 8] ;
end
if (270 > inclination_required)  && (inclination_required> 179)
    Sequence_one_RCS_thrusters_fired=  [1 ; 2 ;7; 8] ; 
    Sequence_two_RCS_thrusters_fired=  [3 ; 4 ;6; 5 ];
end

time_taken = time_maneuver(end); % in seconds



if (360 > inclination_required)  && (inclination_required> 270)
    Sequence_one_RCS_thrusters_fired=  [2 ; 3 ;5; 8] ; 
    Sequence_two_RCS_thrusters_fired=  [1 ; 4 ;6; 7] ; 
end




   