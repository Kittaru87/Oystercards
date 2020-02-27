# Oystercards
Makers week 2: afternoon challenge

## Project aim
To create a program that emulates the oystercard system. The cards must:
* include minimum/maximum balance
* enable top up functionality
* deduct money
* have touch in/touch out support
* charge per journey
* save the current journey (with station name and zone number)
* include a journey log
* calculate the fare per journey
* charge a penalty if certain prerequisites are not met (e.g. never tapped out)

### User stories 
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## How to Use
* git clone https://github.com/Kittaru87/Oystercards.git
* cd Oystercards
* install rspec
```
$ gem install rspec
----------
$ rspec --init
```
* This software runs in irb (or Ruby REPL of choice run through the terminal)

### Example run-through
```
>> irb
2.6.3 :001 > require './Oystercard.rb'
 => true 
2.6.3 :002 > oystercard = Oystercard.new
 => #<Oystercard:0x00007fbc670a93f0 @balance=0, @track_history=[]> 
2.6.3 :003 > oystercard.top_up(50)
 => "You have topped up by £50" 
2.6.3 :004 > oystercard.touch_in("Peckham Rye")
 => "You have tapped into Peckham Rye" 
2.6.3 :005 > oystercard.in_journey?
 => true 
2.6.3 :006 > oystercard.touch_out("Whitechapel")
 => "You have tapped out of Whitechapel" 
2.6.3 :007 > oystercard.balance
 => 49 
2.6.3 :008 > oystercard.track_history
 => [{"Peckham Rye"=>"Whitechapel"}] 
 2.6.3 :009 > oystercard
 => #<Oystercard:0x00007fbc670a93f0 @balance=49, @track_history=[{"Peckham Rye"=>"Whitechapel"}]> 
 ```
 ## Challenges
 This has been a good exercise for consolidating the skills and lessons learnt from the BorisBike and Airport challenges. The most hardest part of the project so far as been learning about forwarding and polymorphism - splitting up the classes then linking them all back together is so far proving hard.