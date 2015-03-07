clc;
cur_macrostate = [0 0 0 0];
for i=1:3
    cas_ent_force = calc_cas_ent_force(cur_macrostate,40,5);
    cur_macrostate = STEP_MACROSTATE(cur_macrostate, cas_ent_force);
end