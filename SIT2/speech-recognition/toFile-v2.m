clc;
clear all,
close all;

N_WORDS = 2;
N_VERSIONS = 12;
SUBSET_LENGTH = 12;
N_REFLEC = 9;

current_database =[]; %struct vektor

%HÖGER VERSIONS
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


%VÄNSTER VERSIONS
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
fprintf(fid, '#include "load_db.h" \n\nvoid load_db(db_t* current_db){\n\n');

counter = 0;


for i = 1:N_WORDS
    for j = 1:N_VERSIONS   
        for col = 1:SUBSET_LENGTH
            formatSpec = 'const float pm reflec%d%d%d%d[N_REFLEC] = {';
            fprintf(fid, formatSpec, i,j,col, row);
            for row = 1:N_REFLEC
                formatSpec('%f, ');
                fprintf(fid, formatSpec, current_database(counter).reflec(row, col));
            end            

        end


    end

end


fprintf(fid, '\t*current_db = db; \n');
fprintf(fid, '\treturn; \n');
fprintf(fid, '} \n');
fclose(fid);

