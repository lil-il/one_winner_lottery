# one_winner_lottery.aleo

##Lottery with one winner in Leo.

### Lottery Flow
The lottery is conducted in a series of stages.
1) **Active**: In the active stage, participants buying tickets. They do so by invoking the `take_part` function.
2) **Finish**: In this stage, the owner of lottery finishes the lottery by invoking the `finish` function. This function writes the address of winner.
3) **Reward**: In this stage, the owner of lottery mints badge to the winner by invoking the `mint_winner_badge` function, which the winner can use to claim the prize.


## Play Guide

To take part in lotery this program, run:
```bash
leo run take_part
```
To choose the winner, run:
```bash
leo run finish
```
To mint the badge to the winner, run:
```bash
leo run mint_winner_badge
```