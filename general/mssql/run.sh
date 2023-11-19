# https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-configure?view=sql-server-ver16&pivots=cs1-bash
# two approach 
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<YourStrong!Passw0rd>' -p 1433:1433 \
-v <host directory>/data:/var/opt/mssql/data \
-v <host directory>/log:/var/opt/mssql/log \
-v <host directory>/secrets:/var/opt/mssql/secrets \
-d mcr.microsoft.com/mssql/server:2022-latest

# to bind volume
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<YourStrong!Passw0rd>' -p 1434:1433 -v sqlvolume:/var/opt/mssql -d mcr.microsoft.com/mssql/server:2022-latest