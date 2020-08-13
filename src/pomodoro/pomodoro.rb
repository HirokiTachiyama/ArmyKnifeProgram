# coding: utf-8
require 'tk'
#require 'C:\Ruby26-x64\lib\ruby\gems\2.6.0\gems\tk-0.2.0\lib\tk'
# https://illyasviel.wiki.fc2.com/wiki/Ruby%E3%81%A7%E3%83%A9%E3%83%BC%E3%83%A1%E3%83%B3%E3%82%BF%E3%82%A4%E3%83%9E%E3%83%BC

Tk.root.title("POMODORO Timer")
Tk.root.width(800) # window幅、効いてない
Tk.root.height(1000) # windows高さ、効いてない
Tk.root.resizable(0, 0) # windowsのサイズを変更不可にする

class Time
  # format文字列に従って現在時刻を返す
  def tNow
    self.strftime("%Y-%m-%d %H:%M:%S")
  end
end

$itimer = nil # タイマー

$work_minutes  = 25 # 作業時間
$break_minutes = 5  # 休憩時間

$work_times  = 0 # 作業した回数
$break_times = 0 # 休憩した回数

$isWorkStartTime = true # 作業中か否か

$isRunning = true

# プログレスバー
$progress = nil

# 作業回数のラベル
$lbl_work = TkLabel.new(
  text: "Work ##{$work_times}"
).grid( row: 1, column: 0 ,padx: 5, pady: 5)
$lbl_work.font(size: 18)

# 休憩回数のラベル
$lbl_break = TkLabel.new(
  text: "Break ##{$break_times}"
).grid( row: 1, column: 1, padx: 5, pady: 5)
$lbl_break.font(size: 18)

# ボタン
$tkb = TkButton.new{
  text "StartUP" # ランダムで顔文字つけたい
  command {pushed}
  bind 'Button-2', proc { print "Click!\n" }
}.grid( row: 1, column: 3, padx: 3, pady:3)
$tkb.font(size: 18)

$lbl_work.configure( fg: 'black', bg: 'gray')
$lbl_break.configure(fg: 'black', bg: 'gray')

# 引数はTimerのループ周期(ミリ秒)

$tktimer = TkTimer.new
TkTimer.start(1000){
  if $itimer != nil
    t1 = ($itimer - Time.now).to_i
    if t1 < 0
      $itimer = nil
      $progress.stop
      if $isWorkStartTime
        $isWorkStartTime = false
        #$lbl_timer.text = "Work##{$break_times + 1} is done."
        $tkb.text = "Work##{$break_times + 1} is done."
        message_box_break
        $itimer = Time.now + ($break_minutes * 60)
        $break_times = $break_times + 1
        $lbl_break.text = "Break ##{$break_times}"

        $progress.configure(maximum: ($itimer - Time.now).to_i + 1)

        
        $lbl_work.configure(fg: 'black', bg: 'gray', underline: -1)
        $lbl_break.configure(fg: 'yellow', bg: 'lightblue', underline: $lbl_break.text.size - 1)
      else
        $isWorkStartTime = true
        $tkb.text = "Break##{$break_times} is done."
        message_box_work
        $itimer = Time.now + ($work_minutes * 60)
        $work_times = $work_times + 1
        $lbl_work.text = "Work ##{$work_times}"

        $progress.configure(maximum: ($itimer - Time.now).to_i + 2)

        $lbl_work.configure(fg: 'green', bg: 'white', underline: $lbl_work.text.size - 1)
        $lbl_break.configure(fg: 'black', bg: 'gray', underline: -1)
      end
    elsif t1 < 60
      $tkb.text = "#{t1} sec"
      $progress.step(1)
    else
      $tkb.text = "#{t1/60} min #{t1%60} sec"
      $progress.step(1)
    end
  end
}
  
def pushed
  $itimer = Time.now + ($work_minutes * 60)
  $work_times = $work_times + 1
  $lbl_work.text = "Work ##{$work_times}"
  $lbl_work.configure(fg: 'green', bg: 'white', underline: $lbl_work.text.size - 1)
  $lbl_break.configure(fg: 'black', bg: 'gray')
  $isRunning = true

  # プログレスバー
  $progress = 
    Tk::Tile::Progressbar.new(nil,
                              mode: 'determinate',
                              orient: 'horizontal',
                              # orient: 'vertical',
                              maximum: ($itimer - Time.now).to_i + 2
                             ).grid(row: 0, column: 0)

  p ($itimer - Time.now).to_i
  
end
  
def message_box_work
  p Tk.messageBox(icon: 'info',
                  title: 'WorkStart',
                  message: "Let's work, #{$work_minutes} minutes.")
end

def message_box_break
  p Tk.messageBox(icon: 'info',
                  title: 'Intermission',
                  message: "take a break, #{$break_minutes} minutes.")
end

Tk.mainloop

