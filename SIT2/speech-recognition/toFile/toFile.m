clc;
clear all,
close all;

N_WORDS = 2;
N_VERSIONS = 12;
SUBSET_LENGTH = 12;
N_REFLEC = 9;

current_database =[]; %struct vektor

%H�GER VERSIONS
load Hanna_db/database/r1.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r2.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r3.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r4.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r5.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r6.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r7.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r8.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r9.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r10.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r11.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/r12.mat;
s.name = 'right';
s.reflec = db;
current_database = [current_database s];


%V�NSTER VERSIONS
load Hanna_db/database/l1.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l2.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l3.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l4.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l5.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l6.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l7.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l8.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l9.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l10.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l11.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];
load Hanna_db/database/l12.mat;
s.name = 'left';
s.reflec = db;
current_database = [current_database s];

formatSpec = 'b%d.reflect[%d] = %f;\n';
fid = fopen('test.txt', 'w');
fprintf(fid, '#include "load_db.h" \n\n');

counter = 0;

for i = 1:N_WORDS
    formatWord = 'word_t const pm word%d = {"%s", ';
    for j = 1:N_VERSIONS
        counter = counter + 1;
        formatSpec = 'version_t const pm version%d%d = {\n \t\t //version \n';
        fprintf(fid, formatSpec, i,j);
        for col = 1:SUBSET_LENGTH
            fprintf(fid, '\t\t0, ');
            for row = 1:N_REFLEC
                fprintf(fid, '%d, ', current_database(counter).reflec(row, col))
            end
            fprintf(fid, ' //block %d \n', col);
        end
        fprintf(fid, '}; \n\n');   
        formatWord = strcat(formatWord, ' &version', num2str(i), num2str(j), ', ');
    end
    fprintf(fid, formatWord, i, current_database(counter).name);
    fprintf(fid,'\n};\n\n');
    
    
end


fprintf(fid, 'void load_db(void){\n\n');
fprintf(fid, '\treturn; \n');
fprintf(fid, '} \n');
fclose(fid);

