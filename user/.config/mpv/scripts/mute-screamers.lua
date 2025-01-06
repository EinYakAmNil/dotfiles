local screamer_list = {
	"Dantes",
	"TF Blade",
	"Tyler1",
}

local function is_screamer(streamer)
	for _, s in pairs(screamer_list) do
		if string.find(streamer, s) then
			return true
		end
	end
end

local function mute_chapter(_, current)
	local chapters = mp.get_property_native("chapter-list")

	if chapters[current] == nil then
		return false
	end

	local current_streamer = chapters[current + 1].title
	if is_screamer(current_streamer) then
		mp.set_property_bool("mute", true)
		mp.osd_message("Muting " .. current_streamer)
	else
		mp.set_property_bool("mute", false)
	end
end
mp.observe_property("chapter", "number", mute_chapter)
