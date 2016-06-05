fileID = fopen('Functions\subA.m','wt');

 
fprintf(fileID,'function [ A ] = subA( x,i )\n');
fprintf(fileID,'pn = x(1);\n');
fprintf(fileID,'pe = x(2);\n');
fprintf(fileID,'h = x(3);\n');
fprintf(fileID,'u = x(4);\n');
fprintf(fileID,'v = x(5);\n');
fprintf(fileID,'w = x(6);\n');
fprintf(fileID,'phi = x(7);\n');
fprintf(fileID,'theta = x(8);\n');
fprintf(fileID,'psi = x(9);\n');
fprintf(fileID,'p = x(10);\n');
fprintf(fileID,'q = x(11);\n');
fprintf(fileID,'r = x(12);\n');

fprintf(fileID,'\n');

fprintf(fileID,'delta1 = i(1);\n');
fprintf(fileID,'delta2 = i(2);\n');
fprintf(fileID,'delta3 = i(3);\n');
fprintf(fileID,'delta4 = i(4);\n');

fprintf(fileID,'\n');

fprintf(fileID,'A = [');
 
 for i = 1:size(Ad,1)-1
     for j = 1:size(Ad,1)-1
         fprintf(fileID,char(Ad(i,j)));
         fprintf(fileID,',');
     end
     fprintf(fileID,char(Ad(i,size(Ad,1))));
     fprintf(fileID,';...\n');
 end

 for j = 1:size(Ad,1)-1
     fprintf(fileID,char(Ad(size(Ad,1),j)));
     fprintf(fileID,',');
 end
 
fprintf(fileID,char(Ad(size(Ad,1),size(Ad,1))));
fprintf(fileID,'];\nend');
fclose(fileID);