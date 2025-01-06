local function loop_file()
	local state = mp.get_property("loop-file")
	if state == "no" then
		mp.osd_message("looping current file")
		mp.set_property_bool("loop-file", "inf")
		return
	end
	mp.osd_message("stop looping current file")
	mp.set_property("loop-file", "no")
end

local function loop_playlist()
	local state = mp.get_property("loop-playlist")
	if state == "no" then
		mp.osd_message("looping entire playlist")
		mp.set_property_bool("loop-playlist", "inf")
		return
	end
	mp.osd_message("stop looping entire playlist")
	mp.set_property("loop-playlist", "no")
end

mp.add_key_binding("l", "loop-file", loop_file)
mp.add_key_binding("L", "loop-playlist", loop_playlist)
