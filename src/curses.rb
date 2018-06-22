require "curses"

include Curses

lines = 40
cols  = 40

begin
	crmodei # ctrl input mode

	setpos((lines - 5) / 2, (cols - 10) / 2)
	addstr("Hit any key")
	refresh
	getch

	message = "Helelo, Curses!"
	width = message.length + 6
	win = Window.new(5, width, (lines - 5) / 2, (cols - width) / 2)
	win.box('|', '-')
	win.setpos(2, 3)
	win.addstr(message)
	win.refresh
	win.getch

	win.close
	refresh
ensure
	close_screen
end
