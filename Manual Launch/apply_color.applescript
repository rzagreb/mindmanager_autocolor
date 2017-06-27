set myColors to {}
copy {255, 202, 150} to end of myColors --- Orange
copy {242, 242, 81} to end of myColors --- Yellow
copy {122, 255, 255} to end of myColors --- Cyan
copy {255, 191, 192} to end of myColors -- Red
copy {188, 255, 120} to end of myColors --- Green (Light)
copy {255, 199, 255} to end of myColors -- Pink
copy {127, 255, 191} to end of myColors --- Green (Dark)
copy {159, 207, 255} to end of myColors --- Blue

repeat with cNum from 1 to length of myColors
	set item 1 of item cNum of myColors to ((item 1 of item cNum of myColors) * 257)
	set item 2 of item cNum of myColors to ((item 2 of item cNum of myColors) * 257)
	set item 3 of item cNum of myColors to ((item 3 of item cNum of myColors) * 257)
end repeat


# Change Colors of Selection
tell application "Mindjet"
	set theDocument to document 1
	set theSelection to selection of theDocument
	set _proj to central topic of theDocument
	if theSelection is not equal to {} then
		# the Selection is array with nodes
		set _topicNum to 0
		repeat with _topic in theSelection
			# Choose Color
			if _topicNum < length of myColors then
				set _topicNum to _topicNum + 1
			else
				set _topicNum to 1
			end if
			
			# Assign Color
			set _color to item _topicNum of myColors
			set fill color of _topic to _color
		end repeat
	end if
end tell