fileID = fopen('Functions\subB.m','wt');

 
fprintf(fileID,'function [ B ] = subB()\n');

fprintf(fileID,'B = [');
 
 for i = 1:size(Bd,1)-1
     for j = 1:size(Bd,2)-1
         fprintf(fileID,char(Bd(i,j)));
         fprintf(fileID,',');
     end
     fprintf(fileID,char(Bd(i,size(Bd,2))));
     fprintf(fileID,';...\n');
 end

 for j = 1:size(Bd,2)-1
     fprintf(fileID,char(Bd(size(Bd,1),j)));
     fprintf(fileID,',');
 end
 
fprintf(fileID,char(Bd(size(Bd,1),size(Bd,2))));
fprintf(fileID,'];\nend');
fclose(fileID);