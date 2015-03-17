% close all;
clc;
max_time = 200;
num_time_steps = 3;
num_time_func = 5;
min_num_sample_paths = 50;
multiplier = 10;

figure;
hold on;

for j =1:num_time_func
    num_sample_paths = min_num_sample_paths + j*multiplier
    cur_macrostate = [0 0 0 0];
 
    coordinates = zeros([max_time 2]);
    for i=1:max_time
        cas_ent_force = calc_cas_ent_force(cur_macrostate,...
                                    num_sample_paths,num_time_steps);
        cur_macrostate = STEP_MACROSTATE(cur_macrostate, cas_ent_force);
        coordinates(i,:) = cur_macrostate(1:2);
    end
    
    plot(1:max_time,coordinates(1:max_time,1),'color',...
                                [1-((j)/20) j/40 j/20],'LineWidth',3);
    legend(num_sample_paths);
end

plot([0 max_time+1], [1.5 1.5]);
drawnow;