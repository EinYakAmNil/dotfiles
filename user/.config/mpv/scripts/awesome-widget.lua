local function update_bar()
	local update_script = os.getenv("XDG_CONFIG_HOME") .. "/awesome/scripts/music"
	mp.commandv("run", update_script, "update")
end

mp.register_event("file-loaded", update_bar)
mp.register_event("shutdown", update_bar)
