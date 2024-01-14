local function save_url()
	local video_url = mp.get_property("path", "")
	local save_path = os.getenv("HOME") .. "/Musik/.download.list"

	local list = io.open(save_path, 'r')

	if list then
		for url in list:lines() do
			if video_url == url then
				local save_msg = "Already saved " .. video_url
				mp.osd_message(save_msg)
				print(save_msg)
				return
			end
		end
	end

	list = io.open(save_path, 'a')

	if list then
		local save_msg = "saving " .. video_url .. " to " .. save_path
		mp.osd_message(save_msg)
		print(save_msg)
		list:write(video_url .. "\n")
		list:close()
		return
	end
end

mp.add_key_binding("s", "save_url", save_url)
