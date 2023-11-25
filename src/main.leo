// The 'lottery' program.
program one_winner_lottery.aleo {

    mapping num_players: u8 => u8;
    mapping winner_num: u8 => u8;
    mapping num_to_address: u8 => address;

    record Winner_badge {
         owner: address,
    }

    //Take part in the lottery
    transition take_part() {
        return then finalize(self.caller);
    }

    finalize take_part(caller: address) {
        let number: u8 = num_players.get_or_use(0u8, 0u8);
        num_to_address.set(number, caller);
        num_players.set(0u8, number + 1u8);
    }

    // Finish the lottery and choose the winner
    // Can be called only by owner of the lottery
    transition finish() {
        // Ensure the caller is the owner.
        assert_eq(self.caller, aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh);
        return then finalize();
    }

    finalize finish() {
            // Randomly select the number.
            let n: u8 = ChaCha::rand_u8();

            // Add winner to winner mapping
            let players: u8 = num_players.get_or_use(0u8, 0u8);
            let winner: u8 = n % (players + 1u8);
            winner_num.set(0u8, winner);
    }

    // Mint the badge to the winner
    // Can be called only by owner of the lottery
    transition mint_winner_badge(winner: address) -> Winner_badge{
            // Ensure the caller is the owner.
            assert_eq(self.caller, aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh);
            return Winner_badge {
                owner: winner,
            };
        }
}
