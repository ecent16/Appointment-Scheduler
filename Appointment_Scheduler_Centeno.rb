# Ervin centenoe
# Adv Programming: Ruby
# Homework 3 Appointment Program

class Appointment
  attr_accessor :year, :month, :day, :description
  @@appArr = []
    def initialize (year, month, day, description)
      @year = year
      @month = month
      @day = day
      @description = description
    end

    def pushApp
      array = [@year, @month, @day, @description]
      @@appArr.push(array)
    end

    def getArr
      p @@appArr
    end

    def OccursOn1

      puts "So on the date #{@year} #{@month} #{@day} their will be an appointment for: "

      i = 0

      while i < @@appArr.length
        if @@appArr[i][0] == @year && @@appArr[i][1] == @month && @@appArr[i][2] == @day
          puts "#{@@appArr[i][3]}"
        end
        i += 1
      end
    end

    def OccursOn2

      puts "So on day #{@day}, their will be an appointment for: "
      i = 0

      while i < @@appArr.length
        if @@appArr[i][2] == @day
          puts "#{@@appArr[i][3]}"
        end
        i += 1
      end
    end

    def OccursOn3

      puts "So in month #{@month}, their will be an appointment for: "
      i = 0

      while i < @@appArr.length
        if @@appArr[i][1] == @month
          puts "#{@@appArr[i][3]}"
        end
        i += 1
      end
    end

end

class OneTime < Appointment
    alias_method :super_OccursOn1, :OccursOn1
    def OccursOn1
      super
    end

end

class Days < Appointment
    alias_method :super_OccursOn2, :OccursOn2
    def OccursOn2
      super
    end
end

class Month < Appointment
    alias_method :super_OccursOn3, :OccursOn3
    def OccursOn3
      super
    end

end

newApp = Appointment.new(2019, 10, 10, "root canal")
newApp.pushApp
newApp = Appointment.new(2019, 10, 8, "braces")
newApp.pushApp
newApp = Appointment.new(2019, 10, 10, "teeth cleaning")
newApp.pushApp
#newApp.getArr

replay = "Y"
while replay == "Y" || replay == "y"
    puts "Welcome to the appointment scheduler. Would you like to create or search for an appointment?:"
    puts "(1) Create Appointment  (2) Search Appointments"

    while menuSelect = gets.chomp.to_i
      case menuSelect

      when 1
        puts "Please enter a date to schedule: "
        date = gets.chomp.split(" ")
        puts "Whats your reason for the appointment:"
        descript = gets.chomp.to_s

        newApp = Appointment.new(date.first.to_i, date[1].to_i, date.last.to_i, descript)
        newApp.pushApp

      when 2
        puts "How would you like to look up the appointments?:"
        puts "(1) By Dates (2) By Day (3) By Month"

        while lookUp = gets.chomp.to_i
          case lookUp
            when 1
              puts "Please enter the date:"
              date = gets.chomp.split(" ")

              getDate = OneTime.new(date.first.to_i, date[1].to_i, date.last.to_i, "")
              getDate.OccursOn1
              break
            when 2
              puts "Please enter the day:"
              day = gets.chomp.to_i

              getDay = Days.new(0, 0, day, "")
              getDay.OccursOn2
              break
            when 3
              puts "Please enter a month:"
              month = gets.chomp.to_i

              getMonth = Month.new(0 ,month, 0, "")
              getMonth.OccursOn3
              break
            else
              puts "Please put in a valid choice:"
            end

        end
      else
        puts "Please put in a valid choice:"
      end

      puts "Would you like to continue using the appointment scheduler?"
      replay = gets.chomp

      if replay != "Y" || replay != "y"
        break
      end
    end
  end

puts "Thank you for using the appointment scheduler!"
