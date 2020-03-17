%Training dataset (75 instances)

%Define Training Inputs

input = [  
        5.1	3.5	1.4	0.2;
        4.9	3.0	1.4	0.2;
        4.7	3.2	1.3	0.2;
        4.6	3.1	1.5	0.2;
        5.0	3.6	1.4	0.2;
        5.4	3.9	1.7	0.4;
        4.6	3.4	1.4	0.3;
        5.0	3.4	1.5	0.2;
        4.4	2.9	1.4	0.2;
        4.9	3.1	1.5	0.1;
        5.4	3.7	1.5	0.2;
        4.8	3.4	1.6	0.2;
        4.8	3.0	1.4	0.1;
        4.3	3.0	1.1	0.1;
        5.8	4.0	1.2	0.2;
        5.7	4.4	1.5	0.4;
        5.4	3.9	1.3	0.4;
        5.1	3.5	1.4	0.3;
        5.7	3.8	1.7	0.3;
        5.1	3.8	1.5	0.3;
        5.4	3.4	1.7	0.2;
        5.1	3.7	1.5	0.4;
        4.6	3.6	1.0	0.2;
        5.1	3.3	1.7	0.5;
        4.8	3.4	1.9	0.2;
        7.0	3.2	4.7	1.4;
        6.4	3.2	4.5	1.5;
        6.9	3.1	4.9	1.5;
        5.5	2.3	4.0	1.3;
        6.5	2.8	4.6	1.5;
        5.7	2.8	4.5	1.3;
        6.3	3.3	4.7	1.6;
        4.9	2.4	3.3	1.0;
        6.6	2.9	4.6	1.3;
        5.2	2.7	3.9	1.4;
        5.0	2.0	3.5	1.0;
        5.9	3.0	4.2	1.5;
        6.0	2.2	4.0	1.0;
        6.1	2.9	4.7	1.4;
        5.6	2.9	3.6	1.3;
        6.7	3.1	4.4	1.4;
        5.6	3.0	4.5	1.5;
        5.8	2.7	4.1	1.0;
        6.2	2.2	4.5	1.5;
        5.6	2.5	3.9	1.1;
        5.9	3.2	4.8	1.8;
        6.1	2.8	4.0	1.3;
        6.3	2.5	4.9	1.5;
        6.1	2.8	4.7	1.2;
        6.4	2.9	4.3	1.3;
        6.3	3.3	6.0	2.5;
        5.8	2.7	5.1	1.9;
        7.1	3.0	5.9	2.1;
        6.3	2.9	5.6	1.8;
        6.5	3.0	5.8	2.2;
        7.6	3.0	6.6	2.1;
        4.9	2.5	4.5	1.7;
        7.3	2.9	6.3	1.8;
        6.7	2.5	5.8	1.8;
        7.2	3.6	6.1	2.5;
        6.5	3.2	5.1	2.0;
        6.4	2.7	5.3	1.9;
        6.8	3.0	5.5	2.1;
        5.7	2.5	5.0	2.0;
        5.8	2.8	5.1	2.4;
        6.4	3.2	5.3	2.3;
        6.5	3.0	5.5	1.8;
        7.7	3.8	6.7	2.2;
        7.7	2.6	6.9	2.3;
        6.0	2.2	5.0	1.5;
        6.9	3.2	5.7	2.3;
        5.6	2.8	4.9	2.0;
        7.7	2.8	6.7	2.0;
        6.3	2.7	4.9	1.8;
        6.7	3.3	5.7	2.1;
        ];

 %Define Training Outputs
 % 0 = Iris Setosa
 % 0.5 = Iris Versicolor
 % 1 = Iris Virginica
 
 output = [ 0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            0.5;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1
          ];

%Normalization of Training inputs

col_min = min(input);
col_max = max(input);
input = (input(:,:) - col_min(:,1)) / (col_max (:,1)- col_min(:,1));

%Define initial (random) weights

w1 = rand(3,4);

w2 = rand(1,3);

%Define Tolerance
z = 0.01;

%Define Learning rate
l = 0.7;
                    
%Network Training

disp('Training started...');
epochs = 5000;
count = 0;
sqE = 0;
sqrE = zeros(epochs, 1);
for i = 1:epochs %no. of epochs
    for j = 1: 75; %no. of instances
        a0 = input(j:j,1:end); %input layer
        a0 = a0';
        n0 = w1*a0;
        a1 = logsig(n0); %output of the first layer
        n1 = w2*a1;
        a2 = logsig(n1); %output of the second layer
        
        e = output(j,1)-a2;
        if(abs(e)<=z)
            e = 0;
        end
        count = count + 1;
        sqE = sqE + (e*e);
        
        
        e2 = a2*(1-a2)*e; %error of the last(second) layer
        
        
        % a1(1-a1)  matrix calculation
        f1 = [
                a1(1,1)*(1-a1(1,1)),0,0;
                0,a1(2,1)*(1-a1(2,1)),0;
                0,0,a1(3,1)*(1-a1(3,1));
             ];
          
        e1 = f1*(e2*w2'); %error of the hidden(first) layer
        %weight increments
        
        delta1 = l*e1*a0';
        delta2 = l*e2*a1';
        
        %update weights and bias
        
         w1 = w1 + delta1;
         
         w2 = w2 + delta2;

    end   
    sqrE(i,1) = sqE/count;
    
end

disp('Training completed.')