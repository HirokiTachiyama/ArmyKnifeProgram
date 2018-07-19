require 'curses'
require 'color_echo/get'

mwin = Curses.init_screen
Curses.start_color
mwin.box(?|, ?-, ?+)

begin
	r = Random.new
	mwin_str  = "Main Window"
	mwin_str = CE.once.fg(:blue).get(r.rand(1..6).to_s)
	mwin_str =  "\e[4" + "c" + ";1m "
	swin1_str = "Sub Window 1"
	swin2_str = "Sub Window 2"

	Curses.setpos(Curses.lines / 2, Curses.cols / 2 - (mwin_str.length / 2))
	Curses.addstr(mwin_str)

	swin1 = mwin.subwin(3, Curses.cols, 0, 0)
	swin1.box(?|, ?-, ?+)
	swin1.setpos(1, Curses.cols / 2 - (swin1_str.length / 2))
	swin1.addstr(swin1_str)
	swin1.refresh

	swin2 = mwin.subwin(3, Curses.cols, Curses.lines - 3, 0)
	swin2.box(?|, ?-, ?+)
	swin2.setpos(1, Curses.cols / 2 - (swin2_str.length / 2))
	# swin2.addstr(swin2_str)
	swin2.refresh

	 Curses.refresh
	 Curses.getch
	loop do

	  mwin_str = CE.once.fg(:blue).get(r.rand(1..6).to_s)
# +r.rand(1..6).to_s+" "+r.rand(1..6).to_s
		Curses.setpos(Curses.lines / 2, Curses.cols / 2 - (mwin_str.length / 2))
		# Curses.delch
		Curses.addstr(mwin_str)
	
		swin2.setpos(1, Curses.cols / 2 - (swin2_str.length / 2))
		swin2_str = r.rand(1..9).to_s
		swin2.addstr(swin2_str)
		 swin2.refresh

Curses.refresh
		sleep(0.1)

	end

ensure
	Curses.close_screen
end
	
