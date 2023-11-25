program one_winner_lottery.aleo;

record Winner_badge:
    owner as address.private;


mapping num_players:
	key as u8.public;
	value as u8.public;


mapping winner_num:
	key as u8.public;
	value as u8.public;


mapping num_to_address:
	key as u8.public;
	value as address.public;

function take_part:
    async take_part self.caller into r0;
    output r0 as one_winner_lottery.aleo/take_part.future;

finalize take_part:
    input r0 as address.public;
    get.or_use num_players[0u8] 0u8 into r1;
    set r0 into num_to_address[r1];
    add r1 1u8 into r2;
    set r2 into num_players[0u8];


function finish:
    assert.eq self.caller aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh;
    async finish into r0;
    output r0 as one_winner_lottery.aleo/finish.future;

finalize finish:
    rand.chacha into r0 as u8;
    get.or_use num_players[0u8] 0u8 into r1;
    add r1 1u8 into r2;
    rem r0 r2 into r3;
    set r3 into winner_num[0u8];


function mint_winner_badge:
    input r0 as address.private;
    assert.eq self.caller aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh;
    cast r0 into r1 as Winner_badge.record;
    output r1 as Winner_badge.record;
