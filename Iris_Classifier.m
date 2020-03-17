clear all;
clc;
disp('Program Started.');
Network_Training;
defaultanswer = {'0.00'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
T=inputdlg('Enter the Sepal length', 'Enter the datails', 1, defaultanswer, options);
if isempty(str2double(T{:}))
   return;
end
x1 =  str2double(T{:});

T=inputdlg('Enter the Sepal width', 'Enter the datails');
x2 =  str2double(T{:});
T=inputdlg('Enter the Petal length', 'Enter the datails');
x3 =  str2double(T{:});
T=inputdlg('Enter the Petal width', 'Enter the datails');
x4 =  str2double(T{:});

disp('Classifying...');

q0 = [ x1 x2 x3 x4; ];
q0 = (q0(:,:) - col_min(:,1)) / (col_max (:,1)- col_min(:,1));
m0 = w1*q0';
q1 = logsig(m0);
m1 = w2*q1;
q2 = logsig(m1);

if ( q2 >= 0.66)
    disp('The category is IRIS Virginica');
end

if ( q2 >= 0.33 && q2 < 0.66)
    disp('The category is IRIS Versicolor');
end

if ( q2 < 0.33)
    disp('The category is IRIS Setosa');
end
