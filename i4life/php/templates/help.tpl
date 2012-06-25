{* help page template *}
{* $Id$ *}

<h3><font color="red"><em>{$message}</em></font></h3>
<div style="text-align:left;margin-left:0.5in;font-size:12pt">
<h4 style="margin-bottom:0;">
Introduction</h4>
<p style="margin-top:0;">
This is the supply side Piping Tools interface. 
The menus of the tools interface are located on the left of the page.
To select a menu, just click on them.
You can use "Data Uploading"
to upload taxonomic data in csv format. After uploading,
you can inspect the uploaded data by using "Uploaded Data".
</p>

<h4 style="margin-bottom:0;">
Home Page</h4>
<p style="margin-top:0;">
At the moment this page is under development but it will eventually show
status information about the Piping Tools, e.g. newly uploaded data,
number of newly uploaded records, number of records have assigned to a GSD ...
</p>

<h4 style="margin-bottom:0;">
Data Uploading</h4>
<p style="margin-top:0;">
Use "Data Colums Setting" to select fields which match your taxa table for
upload. The order of the field selected should be the same as your table.
The "Default Setting" would preset the following fields: "Taxon ID, Kingdom,
Phylum, Class, Order, Family, Genus, Specific epithet,
Scientific name authorship, Accepted name usage ID, Verbatim taxon rank,
Name publish In". Use the "Clear" button to clear all selected fields.
Use the radio buttons to select source of the upload data: "File" for local 
file on your PC; "URL" for data which can be read on a remote server; "File
on server" this option is for "admin" of the Piping Tools only.
In the "Other Options" section, you can choose to ignore the first row of
data for you upload as well as select different field delimited characters.
The "Tag for this upload" is an optional input which will tag this particular
upload with the given tag name, if no tag name is given, the program will
generate a unique tag automatically which is comprised of year, month, data
and the starting internal ID for the uploading records.
After you have set all the correct options, you then press the "Upload" button
to start the upload process.
</p>

<h4 style="margin-bottom:0;">
Uploaded Data</h4>
<p style="margin-top:0;">
You should be automatically re-directed to this page after uploaded your data.
All your uploaded data would show in the table and you can inspect the
uploaded data to ensure they uploaded correctly.
If you want, you can select individual record entry and either edit or delete
it.
</p>

<h4 style="margin-bottom:0;">
Data Summary</h4>
<p style="margin-top:0;">
This page gives a summary of upload history in a list of tag names and records
number. User can select any tag name and delete all the uploaded records
associated with that particular tag name.
</p>

<h4 style="margin-bottom:0;">
User List (Admin Only)</h4>
<p style="margin-top:0;">
This interface is for Piping Tools adminstrator only. Use this page to create
new Piping Tools users.
</p>

<h4 style="margin-bottom:0;">
Change Password</h4>
<p style="margin-top:0;">
If you want to change your password of Piping Tools,
use this page to change it.
</p>

<h4 style="margin-bottom:0;">
Piping Tools Setting (Admin Only)</h4>
<p style="margin-top:0;">
At the moment, there is only one function in this page, which is to clear
all the uploaded records in Piping Tools by clicking of the button, "Reset
Piping Tools". This only clears the "Taxa Table", but all the user records,
i.e. usernames and passwords would remain.
</p>

<h4 style="margin-bottom:0;">
Sign Out</h4>
<p style="margin-top:0;">
After you finished using Piping Tools, click on this link to sign out.
</p>

</div>
