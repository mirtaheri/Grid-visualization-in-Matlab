function custom_marker(type, x, y, size)

% in this function node markers are being shaped according to its type,
% here AC alternator, load , wind turbine and photovoltaics are imported,
% one can add more electrical symbol as wishes.
% ------

    switch type
        
        case 'AC'
            slot = 100;
            theta = linspace(0,2*pi,slot);
            ro = ones(1,slot);
            [x_array, y_array] = pol2cart(theta,ro);
            acSignX = linspace(2*pi, 0,slot);
            acSignY = sin(acSignX);
            x_array = [x_array, linspace(max(x_array)*0.85, min(x_array)*0.85,slot),...
                flip(linspace(max(x_array)*0.85, min(x_array)*0.85,slot))];
            y_array = [y_array, acSignY/3, flip(acSignY/3)];
            plotCustMark(x, y, x_array, y_array, size, 1.5, [0 1 0]);

        case 'WT'
            x_array = ([-0.3000  0   -1.6125         0   -1.0200   -0.0600    2.2050         0    0.2925]);
            y_array = ([2.8000   -0.5500    1.8000   -0.7000   -2.8000   -0.6000   -0.2000   -0.7000    2.8000]);
            plotCustMark(x, y, x_array, y_array, size, 1.5, [0 0 0]);
            
        case 'PV'
            x_array = ([0.8 1 -0.8 -1 0.8]);
            y_array = ([1 -1 -1 1 1]);
            plotCustMark(x, y, x_array, y_array, size, 1, [0 0 1]);
            plot([-0.9*size+x 0.9*size+x],[0+y 0+y],'k',[-0.4*size+x -0.2*size+x],[1*size+y -1*size+y],...
                'k',[0.2*size+x 0.4*size+x],[1*size+y -1*size+y],'k', 'LineWidth',0.5)
            
        case 'Ld'
            x_array=[-0.5 +0.5 +0.5 +1.5  0 -1.5 -0.5 -0.5] ;
            y_array=[-3.7500 -3.7500 1.2500 1.2500 3.7500 1.2500 1.2500 1.2500];
            plotCustMark(x, y, x_array, y_array, size, 1, [1 0 0]);
    end
end

