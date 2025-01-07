--Depends on cpdf (coherent pdf ) being in %path
--splits a pdf into individual pages
on run
	tell application "Finder" to set inputItems to (choose file with prompt "Choose PDF(s):" with multiple selections allowed without invisibles)
	set theFiles to (every item of inputItems)
	open theFiles
end run

on open theItems
	
	repeat with i from 1 to number of items in theItems
		tell application "Finder" to set myPath to container of item i of theItems as string
		set posixMyPath to POSIX path of myPath as text
		tell application "System Events" to set FileName to name of item i of theItems
		set filenameBase to do shell script "cd " & quoted form of posixMyPath & ";var=" & quoted form of FileName & ";echo ${var%.*}"
		
		set myScript to "eval $(/usr/libexec/path_helper -s); source ~/.zshrc; cpdf -split " & quoted form of posixMyPath & FileName & " -o " & quoted form of posixMyPath & filenameBase & "_%%%.pdf"
		--display dialog myScript
		do shell script myScript
	end repeat
	--end tell
end open
