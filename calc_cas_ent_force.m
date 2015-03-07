% cur_macrostate = q_x, q_y, p_x, p_y
function cas_ent_force = calc_cas_ent_force(cur_macrostate, ...
                                        num_sample_path, num_time_steps)
    if nargin == 1
        num_sample_path = 1;
        num_time_steps = 5;
    end
    sample_paths = zeros(4,num_time_steps,num_sample_path);
    
    for i=1:num_sample_path %Montecalo algorithm
        cur_path = zeros(4,num_time_steps);
        cur_state = cur_macrostate;
        
        for n=1:num_time_steps
            cur_state = STEP_MICROSTATE(cur_state);
            cur_path(:,n) = cur_state';
        end
        sample_paths(:,:,i) = cur_path;
    end
    
    log_volume_fracs = LOG_VOLUME_FRACTIONS(sample_paths)
    
    force = zeros(2,1);
    for i = 1:num_sample_path
        force = force + sample_paths(3:4,1,i) * log_volume_fracs(i);
    end
    
    %cas_ent_force = 2* (T_c / T_r) * (1.0 / size(num_sample_path)) * force;
    cas_ent_force = force/num_sample_path;
end