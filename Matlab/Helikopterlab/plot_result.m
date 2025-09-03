
hold off
fig1 = figure(1);
plot(simout(:,7), simout(:, 8)); % Reference
hold on
plot(simout(:,7), simout(:, 3)); % Pitch
grid on
legend("Input","Pitch");
xlabel("Time[s]");
ylabel("Pitch[rad]");

hgexport(fig1, '(1,1).eps');
save('(1,1).mat', 'simout');