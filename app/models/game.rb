class Game < ApplicationRecord
    require 'game_helper'
    include GameHelper
    belongs_to :player

    attribute :finished, :boolean, default: false
    attribute :rolls, :integer, default: 0
    attribute :frame, :integer, default: 1

    #Save a single roll throw
    def play(pins)
        fill_frame(pins)
        self.update(rolls: self.rolls + 1) if !self.finished
    end

    #Return current game
    def current_game
        self.where(finished: false).first
    end

    #Recalculate next Frame not calculated yet... Requires exectute multiple times to get Total Score
    def recalculate
        frames = []
        frames = next_two(opened_frame) if type_frame(opened_frame) == "strike"
        frames = next_one(opened_frame) if type_frame(opened_frame) == "spare"
        self["frame_#{opened_frame}_total"] = total_frame(opened_frame) + frames.sum
        self.save
        self.score = sum_frames
        self.save
    end


    #Fill frame
    def fill_frame(pins)
        #Change frame if strike
        strike_checker(pins)
        spare_checker(pins)
    end

    #Return next one frame opened waiting for calculate 
    def opened_frame
        (1..10).each do |frame|
            return frame if self["frame_#{frame}_total"] == nil 
        end
        return 10
    end

    #Return if frame was X, / or single
    def type_frame(frame)
        return 'strike' if self["frame_#{frame}_roll_1"] == 10  && frame<10
        return 'spare' if ( self["frame_#{frame}_roll_1"] + self["frame_#{frame}_roll_2"] ) == 10 && frame<10
        return 'low' if ( self["frame_#{frame}_roll_1"] + self["frame_#{frame}_roll_2"] ) < 10 && frame<10
    end

    #Get next two throws, necessary when Strike was first
    def next_two(frame)
        rolls = []
        (frame..10).each do |frame|
            t_rolls = 2
            t_rolls = 3 if frame==10
            (1..t_rolls).each do |roll|
                if self["frame_#{frame}_roll_#{roll}"] != nil
                    rolls.push(self["frame_#{frame}_roll_#{roll}"])
                    return rolls if rolls.size==2
                end
            end
        end
    end

    #Get next one throw after spare /
    def next_one(frame)
        rolls = []
        (frame..10).each do |frame|
            t_rolls = 2
            t_rolls = 3 if frame==10
            (1..t_rolls).each do |roll|
                if self["frame_#{frame}_roll_#{roll}"] != nil
                    rolls.push(self["frame_#{frame}_roll_#{roll}"])
                    return rolls if rolls.size==1
                end
            end
        end
    end

    #Calculte Total Score By summarizing partial frames totals
    def sum_frames
        total = 0
        (1..10).each do |f|
            total = total + self["frame_#{f}_total"] if self["frame_#{f}_total"]!=nil
        end
        total
    end

    #Calculate partial frame score to save it on frame_n_total
    def total_frame(frame)
        self["frame_#{frame}_roll_#{1}"] = 0 if self["frame_#{frame}_roll_#{1}"]==nil
        self["frame_#{frame}_roll_#{2}"] = 0 if self["frame_#{frame}_roll_#{2}"]==nil
        self["frame_#{10}_roll_#{3}"] = 0 if self["frame_#{10}_roll_#{3}"]==nil && frame==10
        if frame==10
            (self["frame_#{frame}_roll_#{1}"] + self["frame_#{frame}_roll_#{2}"]  + self["frame_#{frame}_roll_#{3}"] )
        else
            (self["frame_#{frame}_roll_#{1}"] + self["frame_#{frame}_roll_#{2}"]) 
        end
    end
end
