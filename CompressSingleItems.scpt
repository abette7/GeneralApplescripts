on run {input, parameters}
	
	tell application "Finder"
		set theItems to selection
		repeat with i from 1 to (count of theItems)
			set theItem to (item i of theItems) as alias
			set itemPath to quoted form of POSIX path of theItem
			set fileName to name of theItem
			set theFolder to POSIX path of (container of theItem as alias)
			set tmpFile to quoted form of (theFolder & fileName & ".tmp")
			set zipFile to quoted form of (theFolder & fileName & ".zip")
			set myZipScript to "cd " & itemPath & "; ditto -ck " & itemPath & " " & tmpFile & ";mv " & tmpFile & " " & zipFile
			do shell script myZipScript
			
			do shell script "zip -d " & zipFile & " " & "\"__MACOSX/*\" || true"
			do shell script "zip -d " & zipFile & " " & "\"*/.DS_Store\" || true"
			do shell script "zip -d " & zipFile & " " & "\"._*\" || true"
			--display dialog myZipScript
			
		end repeat
	end tell
end run
