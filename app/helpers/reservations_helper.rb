module ReservationsHelper
  def times
    times = [
      "9:00",
      "9:30",
      "10:00",
      "10:30",
      "11:00",
      "11:30",
      "13:00",
      "13:30",
      "14:00",
      "15:00",
      "15:30",
      "16:00",
      "16:30",
    ]
  end

  def check_date(day, result)
    if day < Date.current
      # 予約があってもなくても過去日の場合は2を返却。
      # 2 : 過去日（viewは空白にする）
      return 2
    end
    # 過去日じゃなかったら、resultに応じたものを返す
    result ? 1 : 0
  end

  def is_holiday
  end

  def check_reservation(reservations, day, time)
    result = 0
    reservations_count = reservations.count
    # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
    # reservations_controllerで日にちを設定する
    # 金曜日を全休に設定
    if day.wday == 5
      return 2
    end
    # 土曜日の午後は休診に
    if day.wday == 6 && Time.parse(time) > Time.parse('12:00')
      return 2
    end
    # 日曜日の午前中は休診
    if day.wday == 0 && Time.parse(time) < Time.parse('12:00')
      return 2
    end

    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return check_date(day, result) if result
      end
    elsif reservations_count == 1
      result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
      return check_date(day, result) if result
    elsif reservations_count == 0
      return 0
    end
    check_date(day, result)
  end
end
