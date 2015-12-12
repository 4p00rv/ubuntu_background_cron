pwd = Dir.pwd
pwd = pwd+'/wallpaper' unless pwd.include? 'wallpaper'
png = Dir[pwd+'/*.png']
jpg = Dir[pwd+'/*.jpg']
files = []
files << png << jpg
files.flatten!
files.sort!
wallpaper = rand(files.length).to_i
current_wallpaper = `gsettings get org.gnome.desktop.background picture-uri`
if files.length > 1
	while true 
		if current_wallpaper.include? files[wallpaper]
			wallpaper = rand(files.length).to_i
		else
			break
		end
	end
end
pid = `pgrep gnome-session`
pid.gsub!("\n",'')
addr = `grep -z DBUS_SESSION_BUS_ADDRESS /proc/#{pid}/environ|cut -d= -f2-`
addr.gsub!("\0",'')
addr.gsub!("\n",'')
`DBUS_SESSION_BUS_ADDRESS=#{addr} gsettings set org.gnome.desktop.background picture-uri 'file:///#{files[wallpaper]}'`