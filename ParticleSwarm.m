%% Particle swarm optimization with 15 iterations
options = optimoptions('particleswarm', 'PlotFcn', {@pswplotbestf});
initial_flag = 0;

for iteration = 1:15
    % 2d Shifted Rotated Ackley2s Function with Global Optimum on Bounds
    % [swarmX, swarmVal, swarmExitFlag, swarmOutput] = particleswarm(@(x)benchmark_func(x,7), 2, [-100, -100], [100, 100], options);

    % 10d Shifted Rotated Ackley2s Function with Global Optimum on Bounds
    % [swarmX, swarmVal, swarmExitFlag, swarmOutput] = particleswarm(@(x)benchmark_func(x,7), 10, [-100, -100], [100, 100], options);

    % 2d Shifted Schwefel's Problem 1.2
    [swarmX, swarmVal, swarmExitFlag, swarmOutput] = particleswarm(@(x)benchmark_func(x,2), 2, [-100, -100], [100, 100], options);

    % 10D Shifted Schwefel's Problem 1.2
    % [swarmX, swarmVal, swarmExitFlag, swarmOutput] = particleswarm(@(x)benchmark_func(x,2), 10, [-100, -100], [100, 100], options); %swarmMainX(i,:) = swarmX

    swarmMainVal(iteration) = swarmVal;
    swarmMainExitFlag(iteration) = swarmExitFlag;
    swarmMainOutput(iteration) = swarmOutput;
    
    % Save plot to file
    fname = sprintf('swarm_plot_%d.jpg', iteration);
    saveas(gcf, fname, 'jpg')
end

swarmValMax = max(swarmMainVal);
swarmValMin = min(swarmMainVal);
swarmValMean = mean(swarmMainVal);
swarmValStd = std(swarmMainVal);
