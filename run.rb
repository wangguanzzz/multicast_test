
duration = 180
speed = 1000
lenth = 100

send_limit = (duration*speed*1.2).to_i
effective = duration*speed
limit = (effective*1.1).to_i
text = 'a'* lenth
#-effective {{ effective }} -limit {{ limit }}

receiver_string = "nohup ansible-playbook -i ansible/hosts ansible/01_receiver.yml --extra-vars \"effective=#{effective} limit=#{limit} \" > result_#{speed}_#{lenth}.txt &"
# -text {{ playload }} -limit {{ limit }} -P {{ speed }} 
sender_string = "ansible-playbook -i ansible/hosts ansible/02_sender.yml --extra-vars \"playload=#{text} limit=#{send_limit} speed=#{speed} \""

system(receiver_string)
sleep 5
system(sender_string)
