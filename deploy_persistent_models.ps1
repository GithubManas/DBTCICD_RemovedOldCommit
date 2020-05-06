function fn_deploy
{
param($param_sql_script =$1)
 
  echo "###############################################################################"
  echo "  Script : ${param_sql_script} "
  echo "###############################################################################"
	
  $model_name= $param_sql_script.replace(".sql","")
  dbt run -m $model_name
  #echo $model_name
  
  #execution_status= $_
  #Captures the status of execution of sql script
  #echo "Status of execution : $execution_status"

}



$input = '.\DeployableModels.txt'

$getFileData = Get-Content -Path $input
$concantSQLString = $getFileData -split "," 
ForEach ( $sql_script_file in $concantSQLString ) 
{    
  fn_deploy ($sql_script_file)

}