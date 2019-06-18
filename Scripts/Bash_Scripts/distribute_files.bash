#!/usr/bin/bash
#Author: Thomas S, ATS
#Date: 13 Sept 18
#Description:This script moves all the files in a .zip folder to their appropriate
#            locations, and untars/unzips any files that need to be unzipped

#unzip release_files.zip, which contains all the files from the build request
jar -xvf /qmd/cpr/sw/release_files.zip

#remove old tar and zip files from the globalStreams/vcm directory
rm  /qmd/cpr/sw/rel/globalStreams/vcm/*.tar
rm  /qmd/cpr/sw/rel/globalStreams/vcm/*.zip

#copy global stream files to the globalStreams/vcm directory
cp /qmd/cpr/sw/release_files/*.tar /qmd/cpr/sw/rel/globalStreams/vcm
cp /qmd/cpr/sw/release_files/*.zip /qmd/cpr/sw/rel/globalStreams/vcm

#change file permissions and ownderships
chown root:system /qmd/cpr/sw/rel/globalStreams/vcm/*.tar
chmod 755 /qmd/cpr/sw/rel/globalStreams/vcm/*.tar
chown root:system /qmd/cpr/sw/rel/globalStreams/vcm/*.zip
chmod 755 /qmd/cpr/sw/rel/globalStreams/vcm/*.zip

#untar/unzip
tar -xvf /qmd/cpr/sw/rel/globalStreams/vcm/*.tar
jar -xvf /qmd/cpr/sw/rel/globalStreams/vcm/*.zip

#copy cda files to /qmd/cpr/sw/customer/pc_software/cda
cp /qmd/cpr/sw/release_files/*.exe /qmd/cpr/sw/customer/pc_software/cda.6.2
cp /qmd/cpr/sw/release_files/*.msi /qmd/cpr/sw/customer/pc_software/cda.6.2

#change file permissions and ownderships on the CDA files
chown root:system /qmd/cpr/sw/customer/pc_software/cda.6.2/*
chmod 755 /qmd/cpr/sw/customer/pc_software/cda.6.2/*

#copy novus file to /qmd/cpr/sw/rel/novus/builds
cp /qmd/cpr/sw/release_files/novus* /qmd/cpr/sw/rel/novus/builds

#change file permissions and ownderships on the novus files
chown root:system /qmd/cpr/sw/rel/novus/builds/*
chmod 755 /qmd/cpr/sw/rel/novus/builds/*

