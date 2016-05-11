wget http://mirror.oxygenxml.com/InstData/Editor/Webhelp/oxygen-webhelp.zip
unzip oxygen-webhelp.zip 

wget https://github.com/dita-ot/dita-ot/releases/download/2.2.3/dita-ot-2.2.3.zip
unzip dita-ot-2.2.3.zip 

cp -R com.oxygenxml.* dita-ot-2.2.3/plugins/
mv dita-ot-2.2.3/plugins/com.oxygenxml.webhelp/plugin_2.x.xml dita-ot-2.2.3/plugins/com.oxygenxml.webhelp/plugin.xml
# Add the editlink plugin
git clone https://github.com/ctalau/ditaot-editlink-plugin dita-ot-2.2.3/plugins/com.oxygenxml.editlink/

cd dita-ot-2.2.3/
bin/ant -f integrator.xml 
cd ..

cp licenseKey.txt dita-ot-2.2.3/plugins/com.oxygenxml.webhelp/licensekey.txt

rm -rf out
dita-ot-2.2.3/bin/dita -i $DITAMAP -f webhelp-responsive -filter=$DITAVAL 
