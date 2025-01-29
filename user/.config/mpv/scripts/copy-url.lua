local function copy_url()
	local video_url = mp.get_property("path", "")
	local clipboard = io.popen("xclip -selection clipboard", "w")

	if clipboard then
		clipboard:write(video_url)
		clipboard:close()
		local copy_msg = "Copied " .. video_url .. " to clipboard"
		mp.osd_message(copy_msg)
		print(copy_msg)
	else
		mp.osd_message("Failed to copy to clipboard")
	end
end

mp.add_key_binding("y", "save_url", copy_url)
