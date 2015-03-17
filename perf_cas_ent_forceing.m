close all;
clc;
max_time = 600;
num_sample_paths=200;

figure;
hold on;
title(num_sample_paths);
plot([0 0 3 3 0], [0 3 3 0 0]);
%plot([1 1 2 2 1],[1 2 2 1 1]);
axis([-1 4 -1 4]);
cur_macrostate = [0.1 0.1 0 0];

coordinates = zeros([max_time 2]);
for i=1:max_time
    cas_ent_force = calc_cas_ent_force(cur_macrostate,num_sample_paths,8);
    cur_macrostate = STEP_MACROSTATE(cur_macrostate, cas_ent_force);
    coordinates(i,:) = cur_macrostate(1:2);
    plot(cur_macrostate(1),cur_macrostate(2),'.');
    pause(0.01);
end