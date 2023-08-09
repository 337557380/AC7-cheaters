#!/bin/bash 

time=$(date "+%Y-%m-%d %H:%M:%S")
echo $time

cheaters_ID=(76561199501593849 76561198260965559 76561199005498017 76561198177980518 76561198384137308 76561198917360011 76561198136279568 76561199074107604 76561198971055164 76561199465912684 76561198429941928 76561198076214633 76561198124493664 76561198304384143 76561199036761417 76561198109046260 76561199168111744 76561199390531053 76561199350109238 76561198301721995 76561199245272853 76561198929962823 76561199507205763 76561199363114608 76561199410767018 76561199514372823 76561198396903167 76561198319585202 76561198046742690 76561198117229678 76561199433034628 76561198036859894 76561199361973029 76561199216430196 76561198127073615 76561198854660782 76561199378969003 76561198012246719 76561198829863126 76561198818703363 76561199438934867 76561198281111612 76561199489780880 76561198223744704 76561198892725495 76561199071839304 76561199390199106 76561199310017870 76561198077024574 76561199412285976 76561198043433411 76561198030697690 76561198938976695 76561198980204295 76561198083979694 76561198081430238 76561199048027117 76561198107896591 76561198839646162 76561198073103373 76561198209173436 76561198973679329 76561198026289985 76561199070000800 76561199086244180 76561198084874424 76561198108197134 76561198407886594 76561198101337488 76561198851216499 76561199066388594 76561198078057512 76561198076137075 76561199032447430 76561199028490431 76561198445457868 76561198368034387 76561199116012716 76561198176636826 76561199201981441 76561198080498773 76561199214277508 76561199247196637 76561198143645427 76561198080498773 76561198161141089 76561198035733380 76561198027532793)
cheaters_Name=()

i=0
for cheater in ${cheaters_ID[*]}
do
	Name=`curl -L https://steamcommunity.com/profiles/$cheater |grep 'class="actual_persona_name"' |head -1 |awk -F'>|<' '{print $3}'`
	cheaters_Name[$i]=${Name/|/&#124;}
	let 'i++'
done
echo ${cheaters_Name[*]}

echo '# AceCombat7 cheaters

| name | steam URL |
| ------ | ------ |' > README.md

j=0
while (($j<i))
do
	echo '| '${cheaters_Name[$j]}' | https://steamcommunity.com/profiles/'${cheaters_ID[$j]}' |' >> README.md
	let 'j++'
done

