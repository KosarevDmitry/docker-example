#Configure the time zone
#To run SQL Server in a Linux container with a specific time zone, configure the TZ environment variable (see Configure the time zone on Linux for more information). To find the right time zone value, run the tzselect command from a Linux bash prompt:

tzselect
#After selecting the time zone, tzselect displays output similar to the following:

#The following information has been given:

        #United States
#        Pacific

#Therefore TZ='America/Los_Angeles' will be used.
#You can use this information to set the same environment variable in your Linux container. The following example shows how to run SQL Server in a container in the Americas/Los_Angeles time zone:

#sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<YourStrong!Passw0rd>' \
#   -p 1433:1433 --name sql1 \
#   -e 'TZ=America/Los_Angeles'\
#   -d mcr.microsoft.com/mssql/server:2022-latest