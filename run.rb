
duration = 180
speeds = [16000,18000,20000,22000,24000]
lengths = [100,200,400]
speeds.each do | speed|
lengths.each do | length|
    send_limit = (duration*speed*1.2).to_i
    effective = duration*speed
    limit = (effective*1.1).to_i
    text = 'a'* length
    #-effective {{ effective }} -limit {{ limit }}

    receiver_string = "nohup ansible-playbook -i ansible/hosts ansible/01_receiver.yml --extra-vars \"effective=#{effective} limit=#{limit} \" > result_#{speed}_#{length}.txt &"
    # -text {{ playload }} -limit {{ limit }} -P {{ speed }} 
    sender_string = "ansible-playbook -i ansible/hosts ansible/02_sender.yml --extra-vars \"playload=#{text} limit=#{send_limit} speed=#{speed} \""

    system(receiver_string)
    sleep 5
    system(sender_string)
    sleep 5
end
end
