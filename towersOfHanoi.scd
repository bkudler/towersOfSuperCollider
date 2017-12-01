~disks = [];
~towers = [];

(
~hanoi = {
        arg  disk, src, des, spare;
	      if(disk >= 1, {
		   ~hanoi.value(disk-1, src, spare, des);
		   ~disks = ~disks.add(disk);
		    ~towers = ~towers.add(src);
		   ~hanoi.value(disk-1, spare, des,src);

	    });


}
)

//the hanoi problem solved for ten disks
~hanoi.value(10, 1, 3, 2)


//check the new values
~disks
~towers



Synth(\towers, [\pitch,64]);


//set pitches to .midicps inside towers synths
~pitches = [43,55,57,58,60,62,64,66,67,69].scramble


//iterate through disks playing each value as a pitch in a synth called 'towerOne'
(
{

	~disks.do {arg item;
		Synth(\towerOne, [\pitch, ~pitches[item]]);
		0.5.wait;
	};

}.fork;
)
