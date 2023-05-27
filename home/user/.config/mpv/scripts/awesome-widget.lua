function update_bar()
	mp.commandv("run", "wimusic")
end

mp.register_event("file-loaded", update_bar)
