function next_macrostate = STEP_MACROSTATE(cur_macrostate,cas_ent_force)
next_macrostate = zeros(4,1);
next_macrostate(1) = cur_macrostate(1) + cur_macrostate(3);
next_macrostate(2) = cur_macrostate(2) + cur_macrostate(4);
next_macrostate(3) = cas_ent_force(1);
next_macrostate(4) = cas_ent_force(2);