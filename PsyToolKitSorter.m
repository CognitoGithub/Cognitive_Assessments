data = readtable('data.xlsx')
data = data(:,2:end)
subjectID = data(:,1)
subjectID = table2array(subjectID)
pathprefix = '/data/02_Analysis/Internal/AI02_TranslationalResearch/P001-S005-D004/201_CM04/Data - Under 200ms Removed/';
for s = 1:numel(subjectID)
    cd(pathprefix)s
      subj = subjectID(s);
      dirname = [pathprefix num2str(subj)]
      mkdir(dirname);
      SubjectFiles = data(s,{'SubjectID_1','x0Back_trial_1', 'x1Back_trial_1','x2Back_trial_1','STR_trial_1','Flanker_trial_1'})
zerobackfile = table2array(SubjectFiles(1,2))
zeroback = char(zerobackfile)
if isempty(zeroback) ~= 1
    movefile (zeroback, dirname)
end
onebackfile = table2array(SubjectFiles(1,3))
oneback = char(onebackfile)
if isempty(oneback) ~= 1
movefile(oneback, dirname)
end
twobackfile = table2array(SubjectFiles(1,4))
twoback = char(twobackfile)
if isempty(twoback) ~= 1
movefile(twoback, dirname)
end
stroopfile = table2array(SubjectFiles(1,5))
stroop = char(stroopfile)
if isempty(stroop) ~= 1
movefile(stroop, dirname)
end
flankerfile = table2array(SubjectFiles(1,6))
flanker= char(flankerfile)
if isempty(flanker) ~= 1
movefile(flanker, dirname)
end
end
% for s = 1:numel(subjectID)
% SubjectFiles = data(s,{'SubjectID_1','x0Back_trial_1', 'x1Back_trial_1','x2Back_trial_1','STR_trial_1','Flanker_trial_1'})
% zerobackfile = table2array(SubjectFiles(1,2))
% zeroback = char(zerobackfile)
% onebackfile = table2array(SubjectFiles(1,3))
% oneback = char(onebackfile)
% twobackfile = table2array(SubjectFiles(1,4))
% twoback = char(twobackfile)
% stroopfile = table2array(SubjectFiles(1,5))
% stroop = char(stroopfile)
% flankerfile = table2array(SubjectFiles(1,6))
% flanker= char(flankerfile)
% end
