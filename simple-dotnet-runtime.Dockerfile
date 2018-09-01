# 引入AspNetCore執行階段2.1版
FROM microsoft/dotnet:2.1-aspnetcore-runtime

# 輸出Port 80
EXPOSE 80 

# 宣告環境變數與預設值
ENV DLL_FILENAME=YourAppDllFileName

# 目錄
VOLUME [ "/app" ] 

# 切換工作目錄
WORKDIR /app 

# 進入點
ENTRYPOINT [ "sh" ,"-c", "dotnet $DLL_FILENAME" ] 