def time_code()
    utc_time = Time.now
    time = utc_time + (60*60*9) # 取得される時間はUTC基準なのでJST基準にするために9時間分早めます

    y = time.year
    mon = time.month
    d = time.day
    week = ["日", "月", "火", "水", "木", "金", "土"]
    w = time.wday
    h = time.hour
    min = time.min
    s = time.sec
    
    y_s = time.year.to_s
    mon_s = time.month.to_s
    d_s = time.day.to_s
    h_s = time.hour.to_s
    min_s = time.min.to_s
    s_s = time.sec.to_s

    if mon < 10
        mon_s = "0" << mon_s
    end

    if d < 10
        d_s = "0" << d_s
    end

    if h < 10
        h_s = "0" << h_s
    end

    if min < 10
        min_s = "0" << min_s
    end

    if s < 10
        s_s = "0" << s_s
    end

    timecode = "[" + y_s + "/" + mon_s + "/" + d_s + " " + h_s + "時" + min_s + "分" + s_s + "秒]"
    return timecode 
end

def time_h()
    utc_time = Time.now
    time = utc_time + (60*60*9) # 取得される時間はUTC基準なのでJST基準にするために9時間分早めます
    h = time.hour
    return h
end

def time_ver()
    utc_time = Time.now
    time = utc_time + (60*60*9) # 取得される時間はUTC基準なのでJST基準にするために9時間分早めます
    h = time.hour

    if h > 3 && h <= 11
        timever = "asa"
        return timever
    end

    if h > 11 && h <= 19
        timever = "hiru"
        return timever
    end

    if (h >= 0 && h <= 3) || (h > 19 && h <= 24)
        timever = "yoru"
        return timever
    end

end
