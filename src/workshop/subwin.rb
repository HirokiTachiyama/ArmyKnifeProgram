require "curses"

mwin = Curses.init_screen
mwin.box(?|, ?-, ?+)

begin
	mwin_str  = "Main Window"
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
	swin2.addstr(swin2_str)
	swin2.refresh

	Curses.refresh
	Curses.getch

ensure
	Curses.close_screen
end
	
