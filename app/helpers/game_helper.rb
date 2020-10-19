module GameHelper
    @last_roll = false

    #update record frame and activate next frame when X
    def strike_checker(pins)
        if pins==10 && self.frame==1 && self.frame_1_roll_1==nil
            self.update(frame: 2, frame_1_roll_1: 10)
            return
         end
         if pins==10 && self.frame==2 && self.frame_2_roll_1==nil
            self.update(frame: 3, frame_2_roll_1: 10) 
            return
         end
         if pins==10 && self.frame==3 && self.frame_3_roll_1==nil
            self.update(frame: 4, frame_3_roll_1: 10) 
            return
         end
         if pins==10 && self.frame==4 && self.frame_4_roll_1==nil
            self.update(frame: 5, frame_4_roll_1: 10)
            return
         end
         if pins==10 && self.frame==5 && self.frame_5_roll_1==nil
            self.update(frame: 6, frame_5_roll_1: 10)
            return
         end
         if pins==10 && self.frame==6 && self.frame_6_roll_1==nil
            self.update(frame: 7, frame_6_roll_1: 10)
            return
         end
         if pins==10 && self.frame==7 && self.frame_7_roll_1==nil
            self.update(frame: 8, frame_7_roll_1: 10)
            return
         end
         if pins==10 && self.frame==8 && self.frame_8_roll_1==nil
            self.update(frame: 9, frame_8_roll_1: 10)
            return
         end 
         if pins==10 && self.frame==9 && self.frame_9_roll_1==nil
            self.update(frame: 10, frame_9_roll_1: 10)
            @last_roll = true
            return
         end     
    end
    #update records and first roll result when Spare or /
    def spare_checker(pins)
        if pins<10 && self.frame==1 && self.frame_1_roll_1==nil
            self.update( frame_1_roll_1: pins )
            return
        elsif pins<10 && self.frame==1 && self.frame_1_roll_1!=nil && self.frame_1_roll_2==nil
            self.update(frame: 2, frame_1_roll_2: pins )
            return
        end
        if pins<10 && self.frame==2 && self.frame_2_roll_1==nil
            self.update(frame_2_roll_1: pins) 
            return
        elsif pins<10 && self.frame==2 && self.frame_2_roll_1!=nil && self.frame_2_roll_2==nil
            self.update(frame: 3, frame_2_roll_2: pins )
            return            
        end

         if pins<10 && self.frame==3 && self.frame_3_roll_1==nil
            self.update(frame_3_roll_1: pins) 
            return
         elsif pins<10 && self.frame==3 && self.frame_3_roll_1!=nil && self.frame_3_roll_2==nil
            self.update(frame: 4, frame_3_roll_2: pins )
            return              
         end
         if pins<10 && self.frame==4 && self.frame_4_roll_1==nil
            self.update( frame_4_roll_1: pins)
            return
        elsif pins<10 && self.frame==4 && self.frame_4_roll_1!=nil && self.frame_4_roll_2==nil
            self.update(frame: 5, frame_4_roll_2: pins )
            return                          
         end
        if pins<10 && self.frame==5 && self.frame_5_roll_1==nil
            self.update(frame_5_roll_1: pins)
            return
        elsif pins<10 && self.frame==5 && self.frame_5_roll_1!=nil && self.frame_5_roll_2==nil
            self.update(frame: 6, frame_5_roll_2: pins )
            return              
         end
         if pins<10 && self.frame==6 && self.frame_6_roll_1==nil
            self.update( frame_6_roll_1: pins)
            return
        elsif pins<10 && self.frame==6 && self.frame_6_roll_1!=nil && self.frame_6_roll_2==nil
            self.update(frame: 7, frame_6_roll_2: pins )
            return               
         end
         if pins<10 && self.frame==7 && self.frame_7_roll_1==nil
            self.update(frame_7_roll_1: pins)
            return
        elsif pins<10 && self.frame==7 && self.frame_7_roll_1!=nil && self.frame_7_roll_2==nil
            self.update(frame: 8, frame_7_roll_2: pins )
            return  
         end
         if pins<10 && self.frame==8 && self.frame_8_roll_1==nil
            self.update(frame_8_roll_1: pins)
            return
        elsif pins<10 && self.frame==8 && self.frame_8_roll_1!=nil && self.frame_8_roll_2==nil
            self.update(frame: 9, frame_8_roll_2: pins )
            return             
         end 
        if pins<10 && self.frame==9 && self.frame_9_roll_1==nil
            self.update( frame_9_roll_1: pins)
            return
        elsif pins<10 && self.frame==9 && self.frame_9_roll_1!=nil && self.frame_9_roll_2==nil
            self.update(frame: 10, frame_9_roll_2: pins )
            @last_roll = false
            return    
        end
        finish_checker(pins)
  
    end

    #Check all frame completed and recalculate total score
    def finish_checker(pins)
    
        if @last_roll==true
            @last_roll = false
            return
        end
         
        if self.frame==10 && self.frame_10_roll_1==nil && self.frame_10_roll_2==nil && self.frame_10_roll_3==nil
            self.update( frame_10_roll_1: pins)
            p ' primer  10 ' 
            p pins
            return
        elsif self.frame==10 && self.frame_10_roll_1!=nil && self.frame_10_roll_2==nil && self.frame_10_roll_3==nil
            self.update(frame: 10, frame_10_roll_2: pins )

            if (self.frame_10_roll_1 + self.frame_10_roll_2) < 10
                self.update( finished: true )
                calculate_score
            end
            return    
        elsif self.frame==10 && self.frame_10_roll_1!=nil && self.frame_10_roll_2!=nil && self.frame_10_roll_3==nil
            self.update(frame: 10, frame_10_roll_3: pins, finished: true )
            calculate_score
            return             
        end
    end

    def calculate_score
        (1..10).each do |f|
            self.recalculate
        end
    end


end
