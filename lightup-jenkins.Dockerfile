# 引入jenkins
FROM jenkins/jenkins

#切換使用者為ROOT
USER root

# The method driver /usr/lib/apt/methods/https could not be found
# https://askubuntu.com/questions/104160/method-driver-usr-lib-apt-methods-https-could-not-be-found-update-error
RUN apt-get update
RUN apt-get install apt-transport-https

# Register Microsoft key and feed，參考https://www.microsoft.com/net/download/linux-package-manager/debian9/sdk-current
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget -q https://packages.microsoft.com/config/debian/9/prod.list
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN chown root:root /etc/apt/sources.list.d/microsoft-prod.list

# Install .NET SDK
RUN apt-get update
RUN apt-get install -y dotnet-sdk-2.1

# 切換回Jenkins
USER jenkins
