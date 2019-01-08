filename='ait_result_dataset.GRAF';

%load datafile gernerated by train_model
load(strcat(filename,'.mat'));

%load references

[data_dir,signal_dir]=getLocalProperties();
signal_dir='/Users/mk/GRAF/MIT/baseline/'
reffile = [signal_dir, 'REFERENCE_60s.csv'];
fid = fopen(reffile, 'r');
if(fid ~= -1)
	Ref = textscan(fid,'%s %s','Delimiter',',');
else
	error(['Could not open ' reffile ' for scoring. Exiting...'])
end
fclose(fid);
RECORDS = Ref{1};
target  = Ref{2};

%create dataset
res_dataset.target=char(target);
res_dataset.RecID=char(RECORDS);
%res_dataset.RecID = [];
%res_dataset=dataset2cell(res_dataset);

%write to CSV

export(res_dataset,'File',strcat(filename,'.csv'),'Delimiter',',');