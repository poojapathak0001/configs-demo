#!/bin/bash
################### CDP on GCP - Environment Initialization script#############

################## Configuration File ########################################

./cdp-dev.config

logfile=cdp-bt-in.$(date +%Y-%m-%d_%H:%m).log

################## CDP Project on GCP creation ######################

#echo "Creating project with ProjectId = $ProjectID & Project Name = $ProjectName >> $logfile
#gcloud projects create $ProjectId --name="$ProjectName"
#echo "Project $ProjectId got completed successfully" >>$logfile

################## Create external IP address ##################

#gcloud compute addresses create cdp-dev-external-ip --region us-central1


################# Big Table Instance creation ################################

echo "Creating Big Table Cluster" >> $logfile

echo "Paramters : $cluster and $cluster_zone" >> $logfile

#gcloud beta bigtable instances create $instance --cluster="$cluster" --cluster-zone="$cluster_zone" --description="$description" --instance-type="$instance_type"
big_table_creation_status=$?


#if [ $big_table_creation_status -eq 0 ]
#then
#echo "Big Table creation successfull and status code is $big_table_creation_status" >> $logfile
#else
#echo "Big Table creation failed" >> $logfile
#fi

######################My SQl Object Creation ###############################

echo "run start"
gcloud sql instances import $SqlInstance gs://$bucket/$Sql
echo "run complete"

######################### Big Query Object creation ##############################

echo "big query start"
echo $DataSetId
bq mk --schema ipaddress:string,userid:STRING,clientid:STRING,username:STRING,orgname:STRING,sessionid:STRING,timestamp:STRING,browserfingerprint:STRING,pageurl:STRING,useragent:STRING,sessionstarttime:STRING,sessionendtime:STRING,orderid:STRING,categoryid:STRING,categoryname:STRING,booksection:STRING,price:STRING,isbn:STRING,pagename:STRING,refererurl:STRING -t ${DataSetId}.cdp_analytics_batch
echo "bg query complete"

bq mk --schema IPAddress:string,UserId:string,ClientId:string,UserName:string,OrgName:string,SessionId:string,BrowserFingerPrint:string,RefererUrl:string,PageUrl:string,UserAgent:string,SessionStartTime:string,SessionEndTime:string,TotalHits:string,Tags:string -t "$DataSetId".cdp_analytics_realtime


########################## Big Table Object creation ################################

gcloud components update
sudo gcloud components install cbt --quiet -q
echo project=$ProjectID > ~/.cbtrc
echo instance=$instance >> ~/.cbtrc

cbt createtable omniture
cbt createfamily omniture U



######################### DB Object creation ends ##########################




################ Deploy other objects using yaml file and GCP deployment manager ##################

gcloud deployment-manager deployments create $deployment_name --config $deployment_config_file
deployment_manager_creation_status=$?

if [ $deployment_manager_creation_status -eq 0 ]
then
echo "Deployment Manager creation successfull and status code is $deployment_manager_creation_status" >> $logfile
else
echo "Deployment Manager creation failed" >> $logfile
fi

################ End of Script ######################################################################
