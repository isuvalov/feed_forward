% load matlab_log.txt
load table_sim.dat 
sss=length(loglines_int2(:,1));
table_sim=table_sim(1:sss,:);

table_sim(:,14)=sign(table_sim(:,14));

delta_log=table_sim-loglines_int2;
open table_sim
open loglines_int2
open delta_log
