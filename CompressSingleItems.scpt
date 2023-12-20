on run {input, parameters}
	
	tell application "Finder"
		set theItems to selection
		
		repeat with i from 1 to (count of theItems)
			set theItem to (item i of theItems) as alias
			set itemPath to quoted form of POSIX path of theItem
			set fileName to name of theItem
			set theFolder to quoted form of POSIX path of (container of theItem as alias)
			set tmpFile to quoted form of (theFolder & fileName & ".tmp")
			set zipFile to quoted form of (fileName & ".zip")
			set myZipScript to "cd " & theFolder & "; zip -r -X " & zipFile & " " & "./" & quoted form of fileName
			do shell script myZipScript
			
		
		end repeat
	end tell
end run
