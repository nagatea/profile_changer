module JSTTime
    def self.getTime    # Notice: the return value is treated as UTC.
        return Time.now.utc + (60*60*9)
    end
    def self.getTimeCode
        return getTime().strftime("[%Y/%m/%d %H時%M分%S秒]")
    end
    def self.getTimeVer
        timever = ""
        h = getTime().hour
        timever = "asa" if h > 3 && h <= 11
        timever = "hiru" if h > 11 && h <= 19
        timever = "yoru" if (h >= 0 && h <= 3) || (h > 19 && h <= 24)
        return timever
    end
end
