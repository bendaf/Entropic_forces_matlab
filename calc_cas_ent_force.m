% cur_macrostate = q_x, q_y, p_x, p_y
function cas_ent_force = calc_cas_ent_force(cur_macrostate, num_sample_path, num_time_steps)
    if nargin == 1
        num_sample_path = 1;
        num_time_steps = 5;
    end
    sample_paths = zeros(4,num_time_steps,num_sample_path);
    i = 1;
    while i <= num_sample_path %Montecalo algorithm
        cur_path = zeros(4,num_time_steps);
        cur_state = cur_macrostate;
        n=0;
        while n <= num_time_steps
            cur_path(:,4) = cur_state;
            cur_state = STEP_MICROSTATE(cur_state);
            n=n+1;
        end
        sample_paths(:,:,i) = cur_path;
        i = i + 1;
    end
    
    log_volume_fracs = LOG_VOLUME_FRACTIONS(sample_paths);
    
    force = [0 0 0 0];
    i = 1;
    while i < num_sample_path
        force = force + sample_paths(:,1,i) * log_volume_fracs(i);
        i=i+1;
    end
    
    cas_ent_force = 2* (T_c / T_r) * (1.0 / size(sample_paths)) * force;
end