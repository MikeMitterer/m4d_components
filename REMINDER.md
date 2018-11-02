## Reminder for scripts used for this package

    # 1 - Erstellen der index.html und von pubspec.yaml
    /deploy-samples.sh -x m4d_navpills --force && ./deploy-samples.sh -g m4d_navpills --force
    
    # 2 - In demo.scss _app.scss einfügen
    
    # 3 - main.dart updaten 
    
### Batch-processing .rsync

    # Holt die jeweilige Zeile aus dem .rsync für das Sample
    find samples/ -name ".rsync" | xargs awk 'FNR==4' | cut -d ' ' -f 5-    
    find samples/ -name ".rsync" | xargs awk 'FNR==5' | cut -d ' ' -f 5-
    find samples/ -name ".rsync" | xargs awk 'FNR==9' | cut -d ' ' -f 5-
    ...    
    
### Show all URL for all the .rsyncs

    # Zeigt Zeile x auf .rsync
    export LINE=9 && \
        find samples/ -name ".rsync" | xargs awk "FNR==${LINE}" | cut -d ' ' -f 5- | sed -e "s/.*http:\/\/\([^/]*\)\/.*/http:\/\/\1/"
    
    # List URLs
    find samples/ -name ".rsync" | xargs awk 'FNR==14' | cut -d ' ' -f 5- | sed -e "s/.*http:\/\/\([^/]*\)\/.*/http:\/\/\1/"
    
    # Gen Links for README
    find samples/ -name ".rsync" | xargs awk 'FNR==14' | cut -d ' ' -f 5- | sed -e "s/.*http:\/\/\([^/]*\)\/.*/-\[\1\]\(http:\/\/\1\)/"        
