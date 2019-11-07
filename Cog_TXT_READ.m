% path  and fikename to a data file
clear all;
task = 'SART';
subjects = {'0784'};
path = '\\192.168.1.21\Cognito_Therapeutics\uploads\raw_data\Cognitive Tests\PsyToolKit Files\2019-11-06\';
for subj_idx = 1:length(subjects)
    filename = [path subjects{subj_idx} '\'];
    files = dir(filename);
    if isempty(files)
        fprintf('No Files or Subject Folder exists...\n')
        return
    end
    clear vect
    for idx = 1:length(files)
        if strfind(files(idx).name, task)
            vect(idx) = 1;
        else
            vect(idx) = 0;
        end
    end
    clear idx
    %% stroop
    if strcmp(task, 'stroop')
        clear resp Lat* Corr temp*
        TaskFiles = find(vect);
        for idx = 1:length(TaskFiles)
            file = files(TaskFiles(idx)).name;
            x = importdata([path subjects{subj_idx} '\' file], ' ');
            gcount = 1;
            ccount = 1;
            icount = 1;
            lccount = 1;
            licount = 1;
            for trial_idx = 1:size(x.data,1)
                if strcmp(x.textdata{trial_idx,1},'test')
                    tempCorr(idx,gcount) = x.data(trial_idx,4);
                    tempLat(idx,gcount) = x.data(trial_idx,5);
                    
                    if x.data(trial_idx,1) == 1
                        tempLatCong(idx,ccount) = x.data(trial_idx,5);
                        ccount = ccount + 1;
                    else
                        tempLatInCong(idx,icount) = x.data(trial_idx,5);
                        icount = icount + 1;
                    end
                    
                    
                    if tempCorr(idx,gcount) == 1
                        tempLatCorr(idx,lccount) = x.data(trial_idx,5);
                        lccount = lccount + 1;
                    elseif tempCorr(idx,gcount) == 2
                        tempLatIncc(idx,licount) = x.data(trial_idx,5);
                        licount = licount + 1;
                    end
                    gcount = gcount + 1;
                end
            end
            Corr(idx) = sum(tempCorr(idx,:) == 1)/size(tempCorr,2);
            
            % mean, median and std. deviation of all latencies
            Lat(idx) = mean(tempLat(idx,:),2);
            Lat_med(idx) = median(tempLat(idx,:),2);
            Lat_std(idx) = std(tempLat(idx,:),[], 2);
            
            % mean, median and std. deviation of all congruent latencies
            LatCong(idx) = mean(tempLatCong(idx,:),2);
            LatCong_med(idx) = median(tempLat(idx,:),2);
            LatCong_std(idx) = std(tempLat(idx,:),[], 2);
            
            % mean, median and std. deviation of all incongruent latencies
            LatInCong(idx) = mean(tempLatInCong(idx,:),2);
            LatInCong_med(idx) = median(tempLat(idx,:),2);
            LatInCong_std(idx) = std(tempLat(idx,:),[], 2);

            if lccount ~= 1
                % mean, median and std. deviation of all Correct latencies
                LatCorr(idx) = mean(tempLatCorr(idx,:),2);
                LatCorr_med(idx) = median(tempLatCorr(idx,:),2);
                LatCorr_std(idx) = std(tempLatCorr(idx,:),[],2);
            else
                LatCorr(idx) = nan;
                LatCorr_med(idx) = nan;
                LatCorr_std(idx) = nan;
            end
            if licount ~= 1
                % mean, median and std. deviation of all inCorrect latencies
                LatIncc(idx) = mean(tempLatIncc(idx,:),2);
                LatIncc_med(idx) = median(tempLatIncc(idx,:),2);
                LatIncc_std(idx) = std(tempLatIncc(idx,:),[],2);
            else
                LatIncc(idx) = nan;
                LatIncc_med(idx) = nan;
                LatIncc_std(idx) = nan;
            end
            out = [Corr; Lat; Lat_med; Lat_std; LatCong; LatCong_med; LatCong_std; LatInCong; LatInCong_med; LatInCong_std; LatCorr; LatCorr_med; LatCorr_std; LatIncc; LatIncc_med; LatIncc_std]';
        end
        clear idx
        save([subjects{subj_idx} '_Stroop_Results.txt'], '-ASCII', '-TABS', 'out');
    end
    %% cued stroop
    if strcmp(task, 'cuedstroop')
        clear resp Lat* Corr temp*
        TaskFiles = find(vect);
        for idx = 1:length(TaskFiles)
            file = files(TaskFiles(idx)).name;
            x = importdata([path subjects{subj_idx} '\' file], ' ');
            gcount = 1;
            ccount = 1;
            icount = 1;
            lccount = 1;
            licount = 1;
            for trial_idx = 1:size(x.data,1)
                if strcmp(x.textdata{trial_idx,1},'test')
                    tempCorr(idx,gcount) = x.data(trial_idx,4);
                    tempLat(idx,gcount) = x.data(trial_idx,5);
                    
                    if x.data(trial_idx,1) == 1
                        tempLatCong(idx,ccount) = x.data(trial_idx,5);
                        ccount = ccount + 1;
                    else
                        tempLatInCong(idx,icount) = x.data(trial_idx,5);
                        icount = icount + 1;
                    end
                    
                    
                    if tempCorr(idx,gcount) == 1
                        tempLatCorr(idx,lccount) = x.data(trial_idx,5);
                        lccount = lccount + 1;
                    elseif tempCorr(idx,gcount) == 2
                        tempLatIncc(idx,licount) = x.data(trial_idx,5);
                        licount = licount + 1;
                    end
                    gcount = gcount + 1;
                end
            end
            Corr(idx) = sum(tempCorr(idx,:) == 1)/size(tempCorr,2);
            
            % mean, median and std. deviation of all latencies
            Lat(idx) = mean(tempLat(idx,:),2);
            Lat_med(idx) = median(tempLat(idx,:),2);
            Lat_std(idx) = std(tempLat(idx,:),[], 2);
            
            % mean, median and std. deviation of all congruent latencies
            LatCong(idx) = mean(tempLatCong(idx,:),2);
            LatCong_med(idx) = median(tempLat(idx,:),2);
            LatCong_std(idx) = std(tempLat(idx,:),[], 2);
            
            % mean, median and std. deviation of all incongruent latencies
            LatInCong(idx) = mean(tempLatInCong(idx,:),2);
            LatInCong_med(idx) = median(tempLat(idx,:),2);
            LatInCong_std(idx) = std(tempLat(idx,:),[], 2);
            
            if lccount ~= 1
                % mean, median and std. deviation of all Correct latencies
                LatCorr(idx) = mean(tempLatCorr(idx,:),2);
                LatCorr_med(idx) = median(tempLatCorr(idx,:),2);
                LatCorr_std(idx) = std(tempLatCorr(idx,:),[],2);
            else
                LatCorr(idx) = nan;
                LatCorr_med(idx) = nan;
                LatCorr_std(idx) = nan;
            end
            if licount ~= 1
                % mean, median and std. deviation of all inCorrect latencies
                LatIncc(idx) = mean(tempLatIncc(idx,:),2);
                LatIncc_med(idx) = median(tempLatIncc(idx,:),2);
                LatIncc_std(idx) = std(tempLatIncc(idx,:),[],2);
            else
                LatIncc(idx) = nan;
                LatIncc_med(idx) = nan;
                LatIncc_std(idx) = nan;
            end
            
        end
        out = [Corr; Lat; Lat_med; Lat_std; LatCong; LatCong_med; LatCong_std; LatInCong; LatInCong_med; LatInCong_std; LatCorr; LatCorr_med; LatCorr_std; LatIncc; LatIncc_med; LatIncc_std]';
        clear idx
        save([subjects{subj_idx} '_CuedStroop_Results.txt'], '-ASCII', '-TABS', 'out');
    end
      %% flanker
    if strcmp(task, 'flanker')
        clear resp Lat* Corr temp*
        TaskFiles = find(vect);
        for idx = 1:length(TaskFiles)
            file = files(TaskFiles(idx)).name;
            x = importdata([path subjects{subj_idx} '\' file], ' ');
            gcount = 1;
            ccount = 1;
            icount = 1;
            lccount = 1;
            licount = 1;
            for trial_idx = 1:size(x.data,1)
                if strcmp(x.textdata{trial_idx,1},'test')
                    tempCorr(idx,gcount) = x.data(trial_idx,3);
                    tempLat(idx,gcount) = x.data(trial_idx,4);
                    
                    if x.data(trial_idx,2) == 1
                        tempLatCong(idx,ccount) = x.data(trial_idx,4);
                        ccount = ccount + 1;
                    else
                        tempLatInCong(idx,icount) = x.data(trial_idx,4);
                        icount = icount + 1;
                    end
                    
                    
                    if tempCorr(idx,gcount) == 1
                        tempLatCorr(idx,lccount) = x.data(trial_idx,4);
                        lccount = lccount + 1;
                    elseif tempCorr(idx,gcount) == 2
                        tempLatIncc(idx,licount) = x.data(trial_idx,4);
                        licount = licount + 1;
                    end
                    gcount = gcount + 1;
                end
            end
            % percent correct has no other stats
            Corr(idx) = sum(tempCorr(idx,:) == 1)/size(tempCorr,2);
            % mean, median and std. deviation of all latencies
            Lat(idx) = mean(tempLat(idx,:),2);
            Lat_med(idx) = median(tempLat(idx,:),2);
            Lat_std(idx) = std(tempLat(idx,:),[], 2);
            
            % mean, median and std. deviation of all congruent latencies
            LatCong(idx) = mean(tempLatCong(idx,:),2);
            LatCong_med(idx) = median(tempLat(idx,:),2);
            LatCong_std(idx) = std(tempLat(idx,:),[], 2);
            
            % mean, median and std. deviation of all incongruent latencies
            LatInCong(idx) = mean(tempLatInCong(idx,:),2);
            LatInCong_med(idx) = median(tempLat(idx,:),2);
            LatInCong_std(idx) = std(tempLat(idx,:),[], 2);
            
            if lccount ~= 1
                % mean, median and std. deviation of all Correct latencies
                LatCorr(idx) = mean(tempLatCorr(idx,:),2);
                LatCorr_med(idx) = median(tempLatCorr(idx,:),2);
                LatCorr_std(idx) = std(tempLatCorr(idx,:),[],2);
            else
                LatCorr(idx) = nan;
                LatCorr_med(idx) = nan;
                LatCorr_std(idx) = nan;
            end
            if licount ~= 1
                % mean, median and std. deviation of all inCorrect latencies
                LatIncc(idx) = mean(tempLatIncc(idx,:),2);
                LatIncc_med(idx) = median(tempLatIncc(idx,:),2);
                LatIncc_std(idx) = std(tempLatIncc(idx,:),[],2);
            else
                LatIncc(idx) = nan;
                LatIncc_med(idx) = nan;
                LatIncc_std(idx) = nan;
            end
        end
        out = [Corr; Lat; Lat_med; Lat_std; LatCong; LatCong_med; LatCong_std; LatInCong; LatInCong_med; LatInCong_std; LatCorr; LatCorr_med; LatCorr_std; LatIncc; LatIncc_med; LatIncc_std]';
        clear idx
        save([subjects{subj_idx} '_Flanker_Results.txt'], '-ASCII', '-TABS', 'out');
    end
    %% Go-NOGO
    if strcmp(task, 'GNG')
        clear resp Lat* Corr temp* Go* No* FalseP
        TaskFiles = find(vect);
        for idx = 1:length(TaskFiles)
            file = files(TaskFiles(idx)).name;
            x = importdata([path subjects{subj_idx} '\' file], ' ');
            gcount = 1;
            ngcount = 1;
            FP = 0;
            for trial_idx = 1:size(x.data,1)
                if strcmp(x.textdata{trial_idx,1},'test') && strcmp(x.textdata{trial_idx,2},'go')
                    tempgoLat(idx,gcount) = x.data(trial_idx,2);
                    gcount = gcount + 1;
                elseif strcmp(x.textdata{trial_idx,1},'test') && strcmp(x.textdata{trial_idx,2},'nogo')
                    tempnogoLat(idx,ngcount) = x.data(trial_idx,2);
                    ngcount = ngcount + 1;
                    if x.data(trial_idx,2) ~= 1200
                        FP = FP + 1;
                    end
                end
            end
            clear trial_idx
            GoLat(idx) = mean(tempgoLat(idx,:),2);
            GoLat_med(idx) = median(tempgoLat(idx,:),2);
            GoLat_std(idx) = std(tempgoLat(idx,:),[],2);

            
            NoGoLat(idx) = mean(tempnogoLat(idx,:),2);
            NoGoLat_med(idx) = median(tempnogoLat(idx,:),2);
            NoGoLat_std(idx) = std(tempnogoLat(idx,:),[],2);
            FalseP(idx) = FP;
        end
        clear idx
        out = [GoLat; GoLat_med; GoLat_std; NoGoLat; NoGoLat_med; NoGoLat_std; FalseP]';
        save([subjects{subj_idx} '_GNG_Results.txt'], '-ASCII', '-TABS', 'out');
    end
    %% SART
    if strcmp(task, 'SART')
        clear resp Lat* Corr temp* Go* No* FalseP
        TaskFiles = find(vect);
        if isempty(TaskFiles)
            fprintf('No Task Files Present in Subject Folder\n')
            return
        end
        for idx = 1:length(TaskFiles)
            file = files(TaskFiles(idx)).name;
            x = importdata([path subjects{subj_idx} '\' file], ' ');
            gcount = 1;
            ngcount = 1;
            FP = 0;
            for trial_idx = 1:size(x.data,1)
                if strcmp(x.textdata{trial_idx,1},'test') && strcmp(x.textdata{trial_idx,2},'go')
                    tempgoLat(idx,gcount) = x.data(trial_idx,2);
                    gcount = gcount + 1;
                elseif strcmp(x.textdata{trial_idx,1},'test') && strcmp(x.textdata{trial_idx,2},'nogo')
                    tempnogoLat(idx,ngcount) = x.data(trial_idx,2);
                    ngcount = ngcount + 1;
                    if x.data(trial_idx,2) ~= 900
                        FP = FP + 1;
                    end
                end
            end
            clear trial_idx
            GoLat(idx) = mean(tempgoLat(idx,:),2);
            GoLat_med(idx) = median(tempgoLat(idx,:),2);
            GoLat_std(idx) = std(tempgoLat(idx,:),[],2);
            
            NoGoLat(idx) = mean(tempnogoLat(idx,:),2);
            NoGoLat_med(idx) = median(tempnogoLat(idx,:),2);
            NoGoLat_std(idx) = std(tempnogoLat(idx,:),[],2);
            FalseP(idx) = FP;
        end
        clear idx
        out = [GoLat; GoLat_med; GoLat_std; NoGoLat; NoGoLat_med; NoGoLat_std; FalseP]';
        save([subjects{subj_idx} '_SART_Results.txt'], '-ASCII', '-TABS', 'out');
    end
    %% for Zero Back
    if strcmp(task, '0back')
        clear resp Lat* Corr temp*
        TaskFiles = find(vect);
        for idx = 1:length(TaskFiles)
            file = files(TaskFiles(idx)).name;
            x = importdata([path subjects{subj_idx} '\' file], ' ');
            gcount = 1;
            for trial_idx = 1:size(x.data,1)
                if strcmp(x.textdata{trial_idx,1},'0back')
                    tempCorr(idx,gcount) = x.data(trial_idx,1);
                    tempLat(idx,gcount) = x.data(trial_idx,3);
                    gcount = gcount + 1;
                end
            end
            Corr(idx) = sum(tempCorr(idx,:) == 1)/size(tempCorr,2);
            Lat(idx) = mean(tempLat(idx,:),2);
            Lat_med(idx) = median(tempLat(idx,:),2);
            Lat_std(idx) = std(tempLat(idx,:),[],2);
            out = [Corr; Lat; Lat_med; Lat_std]';
        end
        clear idx
        save([subjects{subj_idx} '_0back_Results.txt'], '-ASCII', '-TABS', 'out');
    end
    %% for 1 Back
    if strcmp(task, '1back')
        clear resp Lat* Corr temp*
        TaskFiles = find(vect);
        for idx = 1:length(TaskFiles)
            file = files(TaskFiles(idx)).name;
            x = importdata([path subjects{subj_idx} '\' file], ' ');
            gcount = 1;
            for trial_idx = 1:size(x.data,1)
                if strcmp(x.textdata{trial_idx,1},task)
                    tempCorr(idx,gcount) = x.data(trial_idx,1);
                    tempLat(idx,gcount) = x.data(trial_idx,3);
                    gcount = gcount + 1;
                end
            end
            Corr(idx) = sum(tempCorr(idx,:) == 1)/size(tempCorr,2);
            Lat(idx) = mean(tempLat(idx,:),2);
            Lat_med(idx) = median(tempLat(idx,:),2);
            Lat_std(idx) = std(tempLat(idx,:),[],2);
            out = [Corr; Lat; Lat_med; Lat_std]';
        end
        clear idx
        save([subjects{subj_idx} '_1back_Results.txt'], '-ASCII', '-TABS', 'out');
    end
    %% for 2 Back
    if strcmp(task, '2back')
        clear resp Lat* Corr temp*
        TaskFiles = find(vect);
        for idx = 1:length(TaskFiles)
            file = files(TaskFiles(idx)).name;
            x = importdata([path subjects{subj_idx} '\' file], ' ');
            gcount = 1;
            for trial_idx = 1:size(x.data,1)
                if strcmp(x.textdata{trial_idx,1},task)
                    tempCorr(idx,gcount) = x.data(trial_idx,1);
                    tempLat(idx,gcount) = x.data(trial_idx,3);
                    gcount = gcount + 1;
                end
            end
            Corr(idx) = sum(tempCorr(idx,:) == 1)/size(tempCorr,2);
            Lat(idx) = mean(tempLat(idx,:),2);          
            Lat_med(idx) = median(tempLat(idx,:),2);
            Lat_std(idx) = std(tempLat(idx,:),[],2);
            out = [Corr; Lat; Lat_med; Lat_std]';
        end
        clear idx
        save([subjects{subj_idx} '_2back_Results.txt'], '-ASCII', '-TABS', 'out');
    end
end