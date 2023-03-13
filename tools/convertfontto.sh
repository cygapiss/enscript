#!/usr/bin/env bash
# Small bashscript to convert a font to another encoding.
# USAGE 
# 	convertfontto fontname outputfontname encoding destination
# 	place the destination into your .enscriptrc file or enscript.cfg
# 	Defaults are : 	encoding - Latin9
# 			outputfontname: fontname-encoding.afm
# 			destination: $HOME/.config/enscript/afm
#
set -eu
font=${1?Please give a font};
encoding=${3:-iso8859-15};
outputfile=${2:-"${font%.*}-$encoding"}
destination=${4:-~/.config/enscript/afm};
fontforge -lang=ff -c "Open(\"$font\");Reencode(\"$encoding\");Generate(\"$outputfile.pfa\")";
mkdir -p $destination
cp "$outputfile.pfa" "$destination/"
cp "$outputfile.afm" "$destination/"
cd $destination
mkafmmap *.afm
