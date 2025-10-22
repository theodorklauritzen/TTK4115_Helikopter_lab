clear;
clc;
close all;

init_heli_3_10;

filename = "labday3_2";
test_folder = 'result';
name_x_k = "x_k";
name_u_k = "u_k";

should_save = true;

testValues = [
    -1, -1, -1, -1, -1;
    -100, -100, -100, -100, -100;
    0, 0, 0, 0, 0;
    1, 1, 1, 1, 1;
    1j, -1j, -1, -1, -1;
    -1+1j, -1-1j, -10, -10, -10;
    -20,-20,-20,-20,-20;
];

num_tests = size(testValues, 1);

start_index = 1;
indexes = start_index:num_tests + start_index - 1;
% indexes = 5;  % To only run one test

load_system(filename);
%set_param(filename, 'StopTime', stop_time);

for index_test = indexes
    pole_vector=testValues(index_test, :);

    L=place(A_hat',C_hat',pole_vector).';

    msg = sprintf("Starting test %d", index_test);
    disp(msg);
    set_param(filename, 'SimulationCommand', 'Start');
    while true  % Waits for it to finish
        pause(1);
        status = get_param(filename, 'SimulationStatus');
        if strcmp(status, 'stopped')
            disp("Finished test!");
            break;
        end
    end
    
    %extractSimout;
    
    if should_save
        simoutFilename = sprintf('test_plots/simout_%d.mat', index_test);
        save(simoutFilename, 'simout');
        plotFilenameEps = sprintf('test_plots/plot_%d.eps', index_test);
        plotFilenamePng = sprintf('test_plots/plot_%d.png', index_test);
        
        hold off
        fig1 = figure('visible', 'off');
        plot(simout(:,7), simout(:, 8)); % Reference
        hold on
        plot(simout(:,7), simout(:, 3)); % Pitch
        grid on
        legend("Input","Pitch");
        xlabel("Time[s]");
        ylabel("Pitch[rad]");

        hgexport(fig1, plotFilenameEps);
        exportgraphics(fig1, plotFilenamePng, 'Resolution', 300);
    end
    
    pause(10);
end
