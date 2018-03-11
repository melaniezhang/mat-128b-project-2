% Give several pairs of InputList and InputWeight values
 InputList = [1; 2; 3];
 InputWeight = [1 2 3];
 Neuron(InputList,InputWeight)
% This gives the case where NET = 14 OUT = 9.999991684719722e-01

 I = [.1;.1;.1];
 O = [.2 .2 .2];
 Neuron(I, O)
% This gives the case where NET = 6.000000000000001e-02 and the
% corresponding OUT = 5.149955016194100e-01

 J = [.01;.01;.01];
 P = [.02 .02 .02];
 Neuron(J, P)
% This gives NET = 6.000000000000001e-04 and the OUT = 5.001499999954999e-01

% From the above three cases we observe that for F = logistics function, as
% NET gets smaller, the value of OUT is getting smaller too. This implies
% that smalle value of NET gives small value of OUT and vice versa.