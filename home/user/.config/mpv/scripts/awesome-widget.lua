function update_bar()
	mp.commandv("run", "wimusic", "update")
end

mp.register_event("file-loaded", update_bar)
mp.register_event("shutdown", update_bar)
