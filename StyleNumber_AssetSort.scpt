--This script assumes file names ave been created with a StyleName_ColorNumber convention.
--files will be sorted into folders named in the first item of the filname delimited with an underscore


on run
	tell application "Finder" to set inputItems to (choose file with prompt "Choose images:" with multiple selections allowed without invisibles)
	set theFiles to (every item of inputItems)
	open theFiles
end run
-- Dropped files will start on open

on open theItems
	repeat with anItem in theItems
		
		tell application "System Events"
			set FileName to name of anItem
			set fileExtension to name extension of anItem
			
		end tell
		
		tell application "Finder" to set myPath to container of anItem
		
		set oldDelimiters to AppleScript's text item delimiters
		set AppleScript's text item delimiters to "_"
		set styleNumber to text item 1 of FileName
		set colorNumber to text item 2 of FileName
		
		
		
		
		tell application "Finder"
			
			if exists folder (styleNumber) of myPath then
				set sortFolder to folder (styleNumber) of myPath
				tell application "Finder" to move file anItem to sortFolder
			else
				set sortFolder to make new folder at myPath with properties {name:styleNumber & " " & colorNumber}
				tell application "Finder" to move file anItem to sortFolder
			end if
		end tell
		
		
		
		
		
	end repeat
end open
