% % % function data_path = getDataPath(load_path)
% % % 
% % % server_path = '\\serverpath\Data\';
% % % 
% % % if ~isempty(strfind(load_path, 'Rat_1'))
% % %     data_path = [server_path 'Rat_1\'];    
% % % elseif ~isempty(strfind(load_path, 'Rat_2'))
% % %     data_path = [server_path 'Rat_2\'];
% % % end

function [data_path, url_path, blob_path] = getDataPath(load_path)
%DATA_PATH Summary of this function goes here
%   Detailed explanation goes here

titanic_url = 'http://140.247.178.149:5900/';
valemax_url = 'http://140.247.178.189:5900/';
sultana_url = 'http://140.247.178.35:5900/';
minotaur_url = 'http://140.247.178.191:5900/';

titanic_samba = '\\140.247.178.8\asheshdhawale\Data\';
valemax_samba = '\\140.247.178.42\asheshdhawale\Data\';
sultana_samba = '\\140.247.178.57\asheshdhawale\Data\';
minotaur_samba = '\\140.247.178.65\asheshdhawale\Data\';

titanic_samba_SW = '\\140.247.178.8\steffenwolff\';
sultana_samba_SW = '\\140.247.178.57\steffenwolff\';
minotaur_samba_SW = '\\140.247.178.65\steffenwolff\';
valemax_samba_SW = '\\140.247.178.42\steffenwolff\';

% titanic_samba = '\\140.247.178.8\steffenwolff\';
% valemax_samba = '\\140.247.178.98\steffenwolff\';
% sultana_samba = '\\140.247.178.209\steffenwolff\';

blob_common = '/root/data/asheshdhawale/Data/';
% blob_common = '/root/data/steffenwolff/';
blob_SW = '/root/data/steffenwolff/';

if ~isempty(strfind(load_path, 'Dhanashri'))
    data_path = [valemax_samba 'Dhanashri\'];
    url_path = valemax_url;
    blob_path = [blob_common 'Dhanashri/'];
    
elseif ~isempty(strfind(load_path, 'Hamir'))
    data_path = [sultana_samba 'Hamir\'];
    url_path = sultana_url;
    blob_path = [blob_common 'Hamir/'];
    
elseif ~isempty(strfind(load_path, 'Hindol'))
    data_path = [titanic_samba 'Hindol\'];
    url_path = titanic_url;
    blob_path = [blob_common 'Hindol/'];
    
elseif ~isempty(strfind(load_path, 'Kamod'))
    data_path = [sultana_samba 'Kamod\'];
    url_path = sultana_url;
    blob_path = [blob_common 'Kamod/'];
    
elseif ~isempty(strfind(load_path, 'Jaunpuri'))
    data_path = [valemax_samba 'Jaunpuri\'];
    url_path = valemax_url;
    blob_path = [blob_common 'Jaunpuri/'];
    
elseif ~isempty(strfind(load_path, 'Gara'))
    data_path = [valemax_samba 'Gara\'];
    url_path = valemax_url;
    blob_path = [blob_common 'Gara/'];
    
elseif ~isempty(strfind(load_path, 'Gandhar'))
    data_path = [valemax_samba 'Gandhar\'];
    url_path = valemax_url;
    blob_path = [blob_common 'Gandhar/'];
    
elseif ~isempty(strfind(load_path, 'GaudMalhar'))
    data_path = [valemax_samba 'GaudMalhar\'];
    url_path = valemax_url;
    blob_path = [blob_common 'GaudMalhar/'];
    
elseif ~isempty(strfind(load_path, 'Gunakari'))
    data_path = [valemax_samba 'Gunakari\'];
    url_path = valemax_url;
    blob_path = [blob_common 'Gunakari/'];
    
elseif ~isempty(strfind(load_path, 'Gorakh'))
    data_path = [valemax_samba 'Gorakh\'];
    url_path = valemax_url;
    blob_path = [blob_common 'Gorakh/'];
    
elseif ~isempty(strfind(load_path, 'Desh'))
    data_path = [valemax_samba 'Desh\'];
    url_path = valemax_url;
    blob_path = [blob_common 'Desh/'];
    
elseif ~isempty(strfind(load_path, 'Champakali'))
    data_path = [titanic_samba 'Champakali\'];
    url_path = titanic_url;
    blob_path = [blob_common 'Champakali/'];
    
elseif ~isempty(strfind(load_path, 'SW60'))
    data_path = [sultana_samba_SW 'SW60\'];
    url_path = sultana_url;
    blob_path = [blob_SW 'SW60/'];
    
elseif ~isempty(strfind(load_path, 'SW59'))
    data_path = [valemax_samba 'SW59\'];
    url_path = valemax_url;
    blob_path = [blob_common 'SW59/'];
    
elseif ~isempty(strfind(load_path, 'SW75'))
    data_path = [sultana_samba_SW 'SW75\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'SW75/'];    
    
elseif ~isempty(strfind(load_path, 'SW77'))
    data_path = ['\\140.247.178.8\steffenwolff\SW77\'];
    url_path = titanic_url;
    blob_path = ['/root/data/steffenwolff/SW77/'];

elseif ~isempty(strfind(load_path, 'SW106'))
    data_path = [sultana_samba_SW 'SW106\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'SW106/'];  

    
elseif ~isempty(strfind(load_path, 'SW110'))
    data_path = [sultana_samba_SW 'SW110\'];
    url_path = sultana_url;
    blob_path = [blob_SW 'SW110/'];  

elseif ~isempty(strfind(load_path, 'SW116'))
    data_path = [sultana_samba_SW 'SW116\'];
    url_path = sultana_url;
    blob_path = [blob_SW 'SW116/'];  

elseif ~isempty(strfind(load_path, 'SW109'))
    data_path = [minotaur_samba_SW 'SW109\'];
    url_path = minotaur_url;
    blob_path = [blob_SW 'SW109/'];  
    
elseif ~isempty(strfind(load_path, 'SW144'))
    data_path = [minotaur_samba_SW 'SW144\'];
    url_path = minotaur_url;
    blob_path = [blob_SW 'SW144/'];  

elseif ~isempty(strfind(load_path, 'SW182'))
    data_path = [titanic_samba_SW 'SW182\'];
    url_path = titanic_url;
    blob_path = [blob_SW 'SW182/'];     

elseif ~isempty(strfind(load_path, 'SW158'))
    data_path = [minotaur_samba 'SW158\'];
    url_path = minotaur_url;
    blob_path = [blob_common 'SW158/'];  
    
elseif ~isempty(strfind(load_path, 'SW163'))
    data_path = [minotaur_samba 'SW163\'];
    url_path = minotaur_url;
    blob_path = [blob_common 'SW163/'];      

elseif ~isempty(strfind(load_path, 'SW160'))
    data_path = [titanic_samba_SW 'SW160\'];
    url_path = titanic_url;
    blob_path = [blob_SW 'SW160/'];        

elseif ~isempty(strfind(load_path, 'SW166'))
    data_path = [titanic_samba_SW 'SW166\'];
    url_path = titanic_url;
    blob_path = [blob_SW 'SW166/'];        

% elseif ~isempty(strfind(load_path, 'SW192'))
%     data_path = [valemax_samba_SW 'SW192\'];
%     url_path = valemax_url;
%     blob_path = [blob_SW 'SW192/'];

elseif ~isempty(strfind(load_path, 'SW192'))
    data_path = ['N:\Steffen\SW192\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'SW192/'];
    
elseif ~isempty(strfind(load_path, 'arches'))
    data_path = '\\140.247.178.8\rpoddar\arches\';
    url_path = titanic_url;
    blob_path = '/root/data/rpoddar/arches/';

elseif ~isempty(strfind(load_path, 'badlands'))
    data_path = '\\140.247.178.8\rpoddar\badlands\';
    url_path = titanic_url;
    blob_path = '/root/data/rpoddar/badlands/';

elseif ~isempty(strfind(load_path, 'SW233'))
%     data_path = ['X:\Steffen\SW233\'];
    data_path = ['X:\SW233\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'SW233/'];

elseif ~isempty(strfind(load_path, 'A046'))
%     data_path = ['X:\Steffen\SW233\'];
    data_path = ['P:\Naama\Ephys\A046\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'A046/'];    

elseif ~isempty(strfind(load_path, 'SW278'))
%     data_path = ['X:\Steffen\SW233\'];
    data_path = ['Y:\SW278\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'A046/'];    

elseif ~isempty(strfind(load_path, 'SWB48'))
%     data_path = ['X:\Steffen\SW233\'];
    data_path = ['E:\EPhys\SWB48\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'A046/'];     
    
elseif ~isempty(strfind(load_path, 'SE39'))
%     data_path = ['X:\Steffen\SW233\'];
    data_path = ['E:\EPhys\SE39\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'A046/']; 

elseif ~isempty(strfind(load_path, 'SNK29'))
%     data_path = ['X:\Steffen\SW233\'];
    data_path = ['E:\EPhys\SNK29\'];
    url_path = valemax_url;
    blob_path = [blob_SW 'A046/'];     
elseif ~isempty(strfind(load_path, 'SNK40'))
    data_path = 'C:\Users\jew052\Desktop\SNK40\';
    url_path = valemax_url;
    blob_path = [blob_SW 'A046/'];
end

