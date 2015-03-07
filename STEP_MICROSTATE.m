% cur_state = [q_x, q_y, p_x, p_y];
function next_state = STEP_MICROSTATE(cur_state)
    next_state = [0 0 0 0];
    
    % q_x
    next_state(1) = cur_state(1) + cur_state(3);
    % q_y
    next_state(2) = cur_state(2) + cur_state(4);
    % p_x
    next_state(3) = round(rand(1)*2 - 1);
    % p_y
    next_state(4) = round(rand(1)*2 - 1);
    
    if     next_state(1)<0
        next_state(1) = 0;
    elseif next_state(2) < 0
        next_state(2) = 0;
    elseif next_state(1) > 3
        next_state(1) = 3;
    elseif next_state(2) > 3
        next_state(2) = 3;
    end
    
end