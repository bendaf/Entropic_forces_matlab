close all;
clc;
cur_macrostate = [0 0 0 0];
figure;
for i=1:3
    cas_ent_force = calc_cas_ent_force(cur_macrostate,50,3);
    cur_macrostate = STEP_MACROSTATE(cur_macrostate, cas_ent_force)
    plot(cur_macrostate(1),cur_macrostate(2),'.');
    axis([-1 1 -1 1]);
    pause(1);
end