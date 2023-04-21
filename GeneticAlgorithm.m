clc, clear, close all;
rng default
global_flag = 0;

%% Optimization with Genetic Algorithm
global_flag = 0;
options = optimoptions('ga', 'PlotFcn', {@gaplotbestf, @gaplotdistance});

for iteration = 1:15
    global_flag = 0;
    
    % 2d Shifted Rotated Ackley2s Function with Global Optimum on Bounds
    % [x_opt, val_opt, exitFlag_opt, output_opt] = ga(@(x)benchmark_func(x, 7),2,options);
    
    % 10 d Shifted Rotated Ackley2s Function with Global Optimum on Bounds
    % [x_opt, val_opt, exitFlag_opt, output_opt] = ga(@(x)benchmark_func(x, 7),10,options);
    
    % 2d Shifted Schwefel's Problem 1.2
    % [x_opt, val_opt, exitFlag_opt, output_opt] = ga(@(x)benchmark_func(x, 2),2,options);
    
    % 10d Shifted Schwefel's Problem 1.2
    [x_opt, val_opt, exitFlag_opt, output_opt] = ga(@(x)benchmark_func(x, 2),10,options);
    
    gaMainX(iteration, :) = x_opt;
    gaMainVal(iteration) = val_opt;
    gaMainExitFlag(iteration) = exitFlag_opt;
    gaMainOutput(iteration) = output_opt;
    
    file_name = sprintf('plot_%d.jpg', iteration);
    saveas(gcf, file_name, 'jpg')
end

max_val = max(gaMainVal);
min_val = min(gaMainVal);
mean_val = mean(gaMainVal);
std_val = std(gaMainVal);
