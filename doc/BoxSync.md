---
title: "Box Sync"
author: "Brian S Yandell"
date: "September 7, 2016"
output:
  pdf_document: default
  html_document: default
---

### Learning Goals

The goal of this exercise is to use Box and the [Box Sync](https://sites.box.com/sync4/) tool to share files. After completing a person will be able to

* login to [UW-Madison Box](https://uwmadison.app.box.com)
* download the [Box Sync](https://uwmadison.app.box.com/settings/sync) app to a laptop
* sync the [DOQTL2 Data Group](https://uwmadison.app.box.com/files/0/f/11159715386/DOQTL2_Data_Club) folder to a laptop
* read files from this synced folder
* upload to the [DOQTL2 Data Group Upload folder](https://uwmadison.app.box.com/files/0/f/11219066452/Upload)
* use SQLite via Firefox to examine [portal_mammals.sqlite](https://uwmadison.app.box.com/files/0/f/11159715386/1/f_94224979028)

### Setup

#### Help and Documentation

As with any tool, it helps to know where to look for questions that arise. Here are some links at Box and UW-Madison:

* [Box at UW-Madison](https://it.wisc.edu/services/box/)
* [Box Knowledge Base at UW](https://kb.wisc.edu/box/)
  + [Getting Started](https://kb.wisc.edu/box/page.php?id=33229) 
  + [Clients and Syncing](https://kb.wisc.edu/box/page.php?id=33789)

New users [Getting Started](https://kb.wisc.edu/box/page.php?id=33229) probably want to turn off [Notifications](https://community.box.com/t5/Account-Information/How-Do-I-Manage-Email-Notifications-From-Box/ta-p/23). See [Clients and Syncing](https://kb.wisc.edu/box/page.php?id=33789) for information on [Box Sync](https://community.box.com/t5/Box-Sync/Get-Started-with-Box-Sync/ta-p/86). Once logged in to [UW Box](https://uwmadison.app.box.com/), you can also learn more at [https://uwmadison.app.box.com/settings/sync](https://uwmadison.app.box.com/settings/sync).

#### Box Account

Open your browser (Firefox preferably for Data Group) and navigate to [box.com](https://box.com). Enter your UW login (`NetID@wisc.edu`) but do NOT enter a password. Box should redirect you to the UW-Madison Box account, where the UW Login page will appear. At this point, enter your NetID and Password for UW-Madison.

You may not have any folders yet. Give the instructor your NetID and s/he can give you access to the [DOQTL2 Data Group](https://uwmadison.app.box.com/files/0/f/11159715386/DOQTL2_Data_Club) folder.

#### Box Sync

Got to [https://uwmadison.app.box.com/settings/sync](https://uwmadison.app.box.com/settings/sync) to get the lastest Box Sync. This site should be able to detect your laptop configuration and get you what you need. Follow instructions to install.

Some things to know:

* Box Sync only works for users in `Editor` mode. Users in this mode can actually change files in this folder.
* Box Sync makes a copy of the folder and all its contents on your computer. This will take up space, so might affect whether or not you use it.

### Using Box Sync to Sync a Folder

There should be a `b` icon on your dashboard. If not, just use your Finder or the Windows File Folder. You should find an entry for `Box Sync`. Open it. It may be empty.

To add folders to Box Sync, go to your Box account via the Browser. Enter the folder you want to sync, or go to its parent folder. Click on the `...` icon and select `Properties`, then `Sync to Computer`. You will be asked if you really want to `Sync Folder`. [You can later Unsync from Box or your laptop.]

Note: in the `Sync to Computer` step, there is also a statement: `If you have not installed Box Sync, [download it](https://uwmadison.app.box.com/settings/sync).` If you click on `download it`, there are instructions to get Box Sync.

### Using Data Group Box folder

Users in `Viewer Upload` mode can view the folder and download files, but not change any file or folder already there. There is an `Upload` folder; please place any file you want to upload into that folder. Go ahead and try it.

### Access Box SQLite Database

Use the Firefox SQLite app (Tools menu after you install it) to Connect to the copy of the `portal_mammals.sqlite` database. Run through some SQL commands on this database to verify that you can do it.

#### Export CSV from SQLite Database

Use the `Export Wizard` button on the Firefox SQLite app to download one of the tables from `portal_mammals.sqlite`. [If the `Export Wizard` button is not there, go to `Table` menu tab and click on `Export Table`.] Be sure to check the `First row contains column names` box. Note that when you export as CSV, it will export the whole table and ignore any SQL selecting and filtering you might have done.

#### Modifying SQLite Database

You should not be able to change the SQLite database in my folder, as it is locked. However, you CAN change SQLite databases in your own folder. This can be a blessing and/or a curse. 
We will talk later about how to manage SQLite databases using the R/dplyr package. Typical use is most likely to copy the SQLite database from Box and use it locally.

#### Box Permissions

Typically, a user is invited to a Box folder with `Viewer Uploader` or `Editor` privileges. (See [UW-Madison Box Collaborator Permissions](https://kb.wisc.edu/box/page.php?id=37618) for details.)
While `Editor` gives one more flexibility, including the ability to use `Box Sync` to syncronize a folder to laptop or desktop, it comes with added responsibility.
That is, an `Editor` can modify or destroy material in Box, so be careful!


