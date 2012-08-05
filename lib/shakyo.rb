#coding: utf-8
require "shakyo/version"
require "readline"
require "curses"
require "io/console"

module Shakyo
  class Viewer
      def initialize(filename)
        @filename=filename
        @source_lines=IO.readlines(@filename)
        @pos=0
      end
      def line_view(pos)
        if 0<=pos && pos<@source_lines.length
          @source_lines[pos]
          else
          ""
        end
      end
      def my_readline
        Curses.clear
        Curses.refresh
        center=10
        (0..(Curses.lines-5)).each do |i|
          Curses.setpos(i, 0)
          Curses.addstr("#{i==center ? "->" : "  "}#{line_view(@pos+i-10)}")
        end
        Curses.setpos(Curses.lines-4, 0)
        Curses.addstr("----------------")
        Curses.setpos(Curses.lines-3, 0)
        Curses.addstr("->#{line_view(@pos)}")
        Curses.setpos(Curses.lines - 1, 0)
        Curses.addstr(
                  "#{@filename}:#{@pos+1}/#{@source_lines.length+1}"+
                  " (COMMAND LIST: next prev quit)"
                  )
        Curses.setpos(Curses.lines - 2, 0)
        Curses.refresh
        Readline.readline("> ",true)
      end
      def eof?
        @source_lines.length <= @pos
      end
      def run
        Curses.init_screen
        begin
          IO.console.echo=true
          while buf = my_readline
              case buf.chomp
                when "prev"
                @pos-=1
                when "next"
                @pos+=1
                when "quit"
                break
                when @source_lines[@pos].chomp
                @pos+=1
              end
              if eof?
                break
              end
          end
          ensure
          Curses.close_screen
        end
      end
  end
end
