function update_block()
	mp.commandv("run", "pkill", "-RTMIN+6", "dwmblocks")
end

mp.register_event("file-loaded", update_block)
