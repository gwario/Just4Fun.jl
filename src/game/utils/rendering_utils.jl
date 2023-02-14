const BORDER_H = "─" # "═"
const BORDER_V = "│" # "║"
const BORDER_L_MID = "├" # "╠"
const BORDER_R_MID = "┤" # "╣"
const BORDER_T_MID = "┬" # "╦"
const BORDER_B_MID = "┴" # "╩"
const BORDER_MID = "┼" # "╬"
const BORDER_T_R = "┐" # "╗"
const BORDER_T_L = "┌" # "╔"
const BORDER_B_R = "┘" # "╝"
const BORDER_B_L = "└" # "╚"


function print_color_examples()
  println(crayon"fg:light_magenta", "fg:light_magenta", crayon"reset")
  println(crayon"fg:magenta",       "fg:magenta",       crayon"reset")
  println(crayon"fg:(0,0,0) bg:light_magenta", "fg:(0,0,0) bg:light_magenta", crayon"reset")
  println(crayon"fg:(0,0,0) bg:magenta",       "fg:(0,0,0) bg:magenta",       crayon"reset")

  println(crayon"fg:light_magenta bold", "fg:light_magenta bold", crayon"reset")
  println(crayon"fg:magenta bold",       "fg:magenta bold",       crayon"reset")
  println(crayon"fg:(0,0,0) bg:light_magenta bold", "fg:(0,0,0) bg:light_magenta bold", crayon"reset")
  println(crayon"fg:(0,0,0) bg:magenta bold",       "fg:(0,0,0) bg:magenta bold",       crayon"reset")
  println(crayon"fg:dark_gray bg:light_magenta bold", "fg:dark_gray bg:light_magenta bold", crayon"reset")
  println(crayon"fg:dark_gray bg:magenta bold",       "fg:dark_gray bg:magenta bold",       crayon"reset")
  println(crayon"fg:light_gray bg:light_magenta bold", "fg:light_gray bg:light_magenta bold", crayon"reset")
  println(crayon"fg:light_gray bg:magenta bold",       "fg:light_gray bg:magenta bold",       crayon"reset")
  println(crayon"fg:default bg:light_magenta bold", "fg:default bg:light_magenta bold", crayon"reset")
  println(crayon"fg:default bg:magenta bold",       "fg:default bg:magenta bold",       crayon"reset")

  println(crayon"fg:light_green", "fg:light_green", crayon"reset")
  println(crayon"fg:green",       "fg:green",       crayon"reset")
  println(crayon"bg:light_green", "bg:light_green", crayon"reset")
  println(crayon"bg:green",       "bg:green",       crayon"reset")
  println(crayon"fg:(0,0,0) bg:light_green bold", "fg:(0,0,0) bg:light_green bold", crayon"reset")
  println(crayon"fg:(0,0,0) bg:green bold",       "fg:(0,0,0) bg:green bold",       crayon"reset")
  println(crayon"fg:dark_gray bg:light_green bold", "fg:dark_gray bg:light_green bold", crayon"reset")
  println(crayon"fg:dark_gray bg:green bold",       "fg:dark_gray bg:green bold",       crayon"reset")
  println(crayon"fg:light_gray bg:light_green bold", "fg:light_gray bg:light_green bold", crayon"reset")
  println(crayon"fg:light_gray bg:green bold",       "fg:light_gray bg:green bold",       crayon"reset")
  println(crayon"fg:default bg:light_green bold", "fg:default bg:light_green bold", crayon"reset")
  println(crayon"fg:default bg:green bold",       "fg:default bg:green bold",       crayon"reset")

  println(crayon"fg:light_yellow",  "fg:light_yellow",  crayon"reset")
  println(crayon"fg:yellow",        "fg:yellow",        crayon"reset") 
  println(crayon"bg:light_yellow",  "bg:light_yellow",  crayon"reset")
  println(crayon"bg:yellow",        "bg:yellow",        crayon"reset")
  println(crayon"fg:(0,0,0) bg:light_yellow bold", "fg:(0,0,0) bg:light_yellow bold", crayon"reset")
  println(crayon"fg:(0,0,0) bg:yellow bold",       "fg:(0,0,0) bg:yellow bold",       crayon"reset")
  println(crayon"fg:dark_gray bg:light_yellow bold", "fg:dark_gray bg:light_yellow bold", crayon"reset")
  println(crayon"fg:dark_gray bg:yellow bold",       "fg:dark_gray bg:yellow bold",       crayon"reset")
  println(crayon"fg:light_gray bg:light_yellow bold", "fg:light_gray bg:light_yellow bold", crayon"reset")
  println(crayon"fg:light_gray bg:yellow bold",       "fg:light_gray bg:yellow bold",       crayon"reset")
  println(crayon"fg:default bg:light_yellow bold", "fg:default bg:light_yellow bold", crayon"reset")
  println(crayon"fg:default bg:yellow bold",       "fg:default bg:yellow bold",       crayon"reset")
  
  println(crayon"fg:light_red",   "fg:light_red", crayon"reset")
  println(crayon"fg:red",         "fg:red",       crayon"reset")
  println(crayon"bg:light_red",   "bg:light_red", crayon"reset")
  println(crayon"bg:red",         "bg:red",       crayon"reset")
  println(crayon"fg:(0,0,0) bg:light_red bold", "fg:(0,0,0) bg:light_red bold", crayon"reset")
  println(crayon"fg:(0,0,0) bg:red bold",       "fg:(0,0,0) bg:red bold",       crayon"reset")
  println(crayon"fg:dark_gray bg:light_red bold", "fg:dark_gray bg:light_red bold", crayon"reset")
  println(crayon"fg:dark_gray bg:red bold",       "fg:dark_gray bg:red bold",       crayon"reset")
  println(crayon"fg:light_gray bg:light_red bold", "fg:light_gray bg:light_red bold", crayon"reset")
  println(crayon"fg:light_gray bg:red bold",       "fg:light_gray bg:red bold",       crayon"reset")
  println(crayon"fg:default bg:light_red bold", "fg:default bg:light_red bold", crayon"reset")
  println(crayon"fg:default bg:red bold",       "fg:default bg:red bold",       crayon"reset")
  
  println(crayon"fg:light_gray",  "fg:light_gray",  crayon"reset")
  println(crayon"fg:dark_gray",   "fg:dark_gray",   crayon"reset")
  println(crayon"bg:light_gray",  "bg:light_gray",  crayon"reset")
  println(crayon"bg:dark_gray",   "bg:dark_gray",   crayon"reset")
  println(crayon"fg:(0,0,0) bg:light_gray bold", "fg:(0,0,0) bg:light_gray bold", crayon"reset")
  println(crayon"fg:dark_gray bg:light_gray bold", "fg:dark_gray bg:light_gray bold", crayon"reset")
  println(crayon"fg:light_gray bg:light_gray bold", "fg:light_gray bg:light_gray bold", crayon"reset")
  println(crayon"fg:default bg:light_gray bold", "fg:default bg:light_gray bold", crayon"reset")

  println(crayon"fg:light_gray bold",  "fg:light_gray",  crayon"reset")
  println(crayon"fg:dark_gray bold",   "fg:dark_gray",   crayon"reset")
  println(crayon"bg:light_gray bold",  "bg:light_gray",  crayon"reset")
  println(crayon"bg:dark_gray bold",   "bg:dark_gray",   crayon"reset")
  println(crayon"fg:(0,0,0) bg:light_gray bold", "fg:(0,0,0) bg:light_gray bold", crayon"reset")
  println(crayon"fg:dark_gray bg:light_gray bold", "fg:dark_gray bg:light_gray bold", crayon"reset")
  println(crayon"fg:light_gray bg:light_gray bold", "fg:light_gray bg:light_gray bold", crayon"reset")
  println(crayon"fg:default bg:light_gray bold", "fg:default bg:light_gray bold", crayon"reset")
end

# default case
CELL_ID_DEFAULT(text)     = string(crayon"fg:light_gray bg:default !bold", text, crayon"reset")
# colors if the cell is dominated by any player
CELL_ID_DOMINATION(text)  = string(crayon"fg:(0,0,0) bg:magenta !bold", text, crayon"reset")
# colors if any player has a majority/minority on the cell
CELL_ID_X_ORITY(text)     = string(crayon"fg:light_gray bg:default !bold", text, crayon"reset")

# colors default case
YELLOW_DEFAULT(text)    = string(crayon"fg:(0,0,0) bg:yellow !bold", text, crayon"reset")
# colors if the yellow player is dominating the cell
YELLOW_DOMINATING(text) = string(crayon"fg:(0,0,0) bg:yellow !bold", text, crayon"reset")
# colors if the yellow player is dominated by another player on the cell
YELLOW_DOMINATED(text)  = string(crayon"fg:(0,0,0) bg:yellow !bold", text, crayon"reset")
# colors if the yellow player has the majority on the cell
YELLOW_MAJORITY(text)   = string(crayon"fg:(0,0,0) bg:yellow bold", text, crayon"reset")
# colors if the yellow player is in minority on the cell
YELLOW_MINORITY(text)   = string(crayon"fg:(0,0,0) bg:yellow !bold", text, crayon"reset")

RED_DEFAULT(text)   = string(crayon"fg:(0,0,0) bg:red !bold", text, crayon"reset")
RED_DOMINATING(text)= string(crayon"fg:(0,0,0) bg:red !bold", text, crayon"reset")
RED_DOMINATED(text) = string(crayon"fg:(0,0,0) bg:red !bold", text, crayon"reset")
RED_MAJORITY(text)  = string(crayon"fg:(0,0,0) bg:red bold", text, crayon"reset")
RED_MINORITY(text)  = string(crayon"fg:(0,0,0) bg:red !bold", text, crayon"reset")

GREEN_DEFAULT(text)     = string(crayon"fg:(0,0,0) bg:green !bold", text, crayon"reset")
GREEN_DOMINATING(text)  = string(crayon"fg:(0,0,0) bg:green !bold", text, crayon"reset")
GREEN_DOMINATED(text)   = string(crayon"fg:(0,0,0) bg:green !bold", text, crayon"reset")
GREEN_MAJORITY(text)    = string(crayon"fg:(0,0,0) bg:green bold", text, crayon"reset")
GREEN_MINORITY(text)    = string(crayon"fg:(0,0,0) bg:green !bold", text, crayon"reset")

MAGENTA_DEFAULT(text)     = string(crayon"fg:(0,0,0) bg:magenta !bold", text, crayon"reset")
MAGENTA_DOMINATING(text)  = string(crayon"fg:(0,0,0) bg:magenta !bold", text, crayon"reset")
MAGENTA_DOMINATED(text)   = string(crayon"fg:(0,0,0) bg:magenta !bold", text, crayon"reset")
MAGENTA_MAJORITY(text)    = string(crayon"fg:(0,0,0) bg:magenta bold", text, crayon"reset")
MAGENTA_MINORITY(text)    = string(crayon"fg:(0,0,0) bg:magenta !bold", text, crayon"reset")

domination_cell_style(p::Player) = dominating_style(p)

default_style(player::Player) =
 player == YELLOW   ? YELLOW_DEFAULT  :
 player == RED      ? RED_DEFAULT     :
 player == MAGENTA  ? MAGENTA_DEFAULT :
 player == GREEN    ? GREEN_DEFAULT   :
                      throw(AssertionError("Unhandled player"))

dominated_style(player::Player) =
  player == YELLOW  ? YELLOW_DOMINATED  :
  player == RED     ? RED_DOMINATED     :
  player == MAGENTA ? MAGENTA_DOMINATED :
  player == GREEN   ? GREEN_DOMINATED   :
                      throw(AssertionError("Unhandled player"))

dominating_style(player::Player) =
  player == YELLOW  ? YELLOW_DOMINATING   :
  player == RED     ? RED_DOMINATING      :
  player == MAGENTA ? MAGENTA_DOMINATING  :
  player == GREEN   ? GREEN_DOMINATING    :
                      throw(AssertionError("Unhandled player"))

majority_style(player::Player) =
  player == YELLOW  ? YELLOW_MAJORITY   :
  player == RED     ? RED_MAJORITY      :
  player == MAGENTA ? MAGENTA_MAJORITY  :
  player == GREEN   ? GREEN_MAJORITY    :
                      throw(AssertionError("Unhandled player"))

minority_style(player::Player) =
  player == YELLOW  ? YELLOW_MINORITY   :
  player == RED     ? RED_MINORITY      :
  player == MAGENTA ? MAGENTA_MINORITY  :
  player == GREEN   ? GREEN_MINORITY    :
                      throw(AssertionError("Unhandled player"))

player_name(p::Player) =
 p == YELLOW  ? "Yellow"  :
 p == RED     ? "Red"     :
 p == MAGENTA ? "Magenta" :
                "Green"

padded(s; front=true, length=2, padding_char=' ') = front ? lpad(s, length, padding_char) : rpad(s, length, padding_char)
player_stones(field_stones, position, p::Player) = field_stones[position[2], position[1], to_index(p)]

function print_upper_border(board_size::Tuple{Int64,Int64})
  
  border = repeat(BORDER_H, 6)
  for x in 1:board_size[2]
    if x == 1
      print(BORDER_T_L, border, BORDER_T_MID)
    elseif x == board_size[2]
      print(border, BORDER_T_R)
    else
      print(border, BORDER_T_MID)
    end
  end
  println()
end

function print_lower_border(board_size::Tuple{Int64,Int64})
  border = repeat(BORDER_H, 6)
  for x in 1:board_size[2]
    if x == 1
      print(BORDER_B_L, border, BORDER_B_MID)
    elseif x == board_size[2]
      print(border, BORDER_B_R)
    else
      print(border, BORDER_B_MID)
    end
  end
  println()
end

function print_middle_border(board_size::Tuple{Int64,Int64})
  border = repeat(BORDER_H, 6)
  for x in 1:board_size[2]
    if x == 1
      print(BORDER_L_MID, border, BORDER_MID)
    elseif x == board_size[2]
      print(border, BORDER_R_MID)
    else
      print(border, BORDER_MID)
    end
  end
  println()
end

"""
print_player_stones(g::Just4FunEnv, pos::Tuple{Int64,Int64}, p::Player)

prints the visual representation of a player's stones on the cell.
"""
function print_player_stones(g::Just4FunEnv, pos::Tuple{Int64,Int64}, p::Player)
  
  all_player_stones = g.field_stones[pos[2], pos[1], :]
  p_stones = player_stones(g.field_stones, pos, p)

  if dominant_player(all_player_stones) == p || dominated(all_player_stones, p) || p_stones == 0
    print("  ")
  else
    if has_majority(all_player_stones, p)
      style = majority_style(p)
    elseif has_minority(all_player_stones, p)
      style = minority_style(p)
    else
      style = default_style(p)
    end
    stones = padded(p_stones; front=p == YELLOW ? false : true)
    print(style(stones))
  end
end

function print_cell_id(g::Just4FunEnv, pos::Tuple{Int64,Int64})
  field_value = FIELD_VALUES[pos[2], pos[1]]
  field_stones = g.field_stones[pos[2], pos[1], :]
  p = dominant_player(field_stones)
  if !isnothing(p)
    style = dominating_style(p)
    print(style(padded(field_value)))
  else
    print(CELL_ID_DEFAULT(padded(field_value)))
  end
end

print_left_player_stones(g::Just4FunEnv, pos::Tuple{Int64,Int64})    = print_player_stones(g, pos, YELLOW)
print_right_player_stones(g::Just4FunEnv, pos::Tuple{Int64,Int64})   = print_player_stones(g, pos, RED)
print_top_player_stones(g::Just4FunEnv, pos::Tuple{Int64,Int64})     = print_player_stones(g, pos, GREEN)
print_bottom_player_stones(g::Just4FunEnv, pos::Tuple{Int64,Int64})  = print_player_stones(g, pos, MAGENTA)

function print_cell(g::Just4FunEnv, board_size::Tuple{Int64,Int64}, y::Int64)
  # row for player 4
  for x in 1:board_size[2]
    pos = (x, y)
    print(x == 1 ? "$BORDER_V  " : "  ")
    if NUM_PLAYERS == 4
      print_top_player_stones(g, pos)
    else
      print("  ")
    end
    print("  $BORDER_V")
  end
  println()
  # row for player 1, the numbers / cell id and player 2
  for x in 1:board_size[2]
    pos = (x, y)
    print(x == 1 ? BORDER_V : "")
    print_left_player_stones(g, pos)
    print_cell_id(g, pos)
    print_right_player_stones(g, pos)
    print(BORDER_V)
  end
  println()
  # row for player 3
  for x in 1:board_size[2]
    pos = (x, y)
    print(x == 1 ? "$BORDER_V  " : "  ")
    if NUM_PLAYERS == 3
      print_bottom_player_stones(g, pos)
    else
      print("  ")
    end
    print("  $BORDER_V")
  end
  println()
end


"""
print_curplayercards(g::Just4FunEnv)

Prints the current player's cards.
Safe to be displayed to the current player.
"""
function print_curplayercards(g::Just4FunEnv)
  #name = player_name(g.curplayer)
  cards_str = join(sort(convert(Array{Int64}, curplayercards(g))), " ")
  println(string("Your's hand: $cards_str"))
end

"""
print_playercards(g::Just4FunEnv)

Prints all players' cards.
NOTE: This inforamtion is sensitive!
"""
function print_playercards(g::Just4FunEnv)
  name_max_len = max([length(player_name(Player(i))) for i in 1:NUM_PLAYERS]...)

  for player_index in range(YELLOW; length=NUM_PLAYERS)
    player = Player(player_index)
    cards_str = join(sort(convert(Array{Int64}, playercards(g, player))), " ")
    name_str = lpad(player_name(player), name_max_len)
    println("$name_str's hand: $cards_str $(player == g.curplayer ? "(you)" : "")")
  end
end


"""
print_card_actions(card_combinations::Vector{Cards})

Prints the possible actions of playing cards.
"""
function print_card_actions(spec::Just4FunSpec, card_combinations::Vector{Cards})
  println("Possible actions to play:")
  max_card_len = length(string(maximum(DECK)))
  separator_len = length(CARD_ACTION_SEPARATOR)
  max_card_str_len = max_card_len + separator_len
  max_cards_string_length = length(repeat(repeat(" ", max_card_str_len), SIZE_HAND))
  
  for i in eachindex(card_combinations)
    combi = card_combinations[i]
    action_string = padded(sum(combi))
    cards_int = convert(Array{Int64}, combi)
    cards_strings = [string(card_int) for card_int in cards_int]
    cards_string = join(cards_strings, CARD_ACTION_SEPARATOR)
    cards_string_length = length(cards_string)
    padding_string_len =  max_cards_string_length - cards_string_length
    padding_string = repeat(CARD_LABEL_PADDING, padding_string_len)
    color = iseven(i) ? crayon"fg:default" : crayon"fg:dark_gray" 
    println(string(color, "$cards_string$padding_string -> $action_string", crayon"reset"))
  end
end

"""
print_redraw_action()

Prints the redraw action that is mandatory if there are no card combinations possible.
"""
function print_redraw_action()
  @warn "No possible combination of cards to play!"
  println("No moves possible!")
  println(string(crayon"fg:dark_gray", "redraw     -> Redraw cards", crayon"reset"))
end

"""
print_curplayer_actions(g::Just4FunEnv)

Prints the current player's possible actions - possible card combinations.
Safe to be displayed to the current player.
"""
function print_curplayer_actions(g::Just4FunEnv)
  spec = GI.spec(g)

  card_combinations = regular_combinations(FIELD_VALUES, curplayercards(g))
  combination_pos = [sum(combi) for combi = card_combinations]

  if isdisjoint(FIELD_VALUES, combination_pos)
    print_redraw_action()
  else
    print_card_actions(spec, card_combinations)
  end
end

"""
print_gamecards(g::Just4FunEnv)

Prints the game cards (the not yet dealt cards)
NOTE: This inforamtion is sensitive!
"""
function print_gamecards(g::Just4FunEnv)
  println("Unused cards: (top most card) ", join(convert(Vector{Int64},reverse(collect(Iterators.reverse(g.stack)))), " "))
end

#"""
#print_possibly_available_cards(g::Just4FunEnv)
#
#Prints the game cards and the cards of the other player.
#Safe to be displayed to the current player.
#"""
#function print_curplayer_possibly_available_cards(g::Just4FunEnv)
#  # println("Possibly available cards: ", join(sort(convert(Array{Int64}, cat(g.gamecards, otherplayercards(g), dims=1))), " "))
#  other_cards = cat(g.stack, otherplayercards(g), dims=1)
#  unique_cards = unique(other_cards)
#  card_num = SortedDict([(this_card, count(card -> card == this_card, other_cards)) for this_card in unique_cards])
#
#  println("Possibly available cards:")
#  for card in keys(card_num)
#    num = convert(Int64, card_num[card])
#    println("$(padded(num)) x '$(padded(convert(Int64, card)))'")
#  end
#end

"""
print_used_cards(g::Just4FunEnv)

Prints the used cards.
Safe to be displayed to the current player.
"""
function print_used_cards(g::Just4FunEnv)
  unique_cards = unique(g.used_cards)
  card_num = SortedDict([(this_card, count(card -> card == this_card, g.used_cards)) for this_card in unique_cards])

  println("Used cards:")
  for card in keys(card_num)
    num = convert(Int64, card_num[card])
    println("$(padded(num)) x '$(padded(convert(Int64, card)))'")
  end
end

"""
print_player_remaining_stones(g::Just4FunEnv)

Prints the remaining stones of all other players.
Safe to be displayed to the current player.
"""
function print_player_remaining_stones(g::Just4FunEnv)
  name_max_len = max([length(player_name(Player(i))) for i in 1:NUM_PLAYERS]...)

  for player_index in range(YELLOW; length=NUM_PLAYERS)
    player = Player(player_index)
    player_stones = g.player_stones[player_index]
    name_str = lpad(player_name(player), name_max_len)
    println("$name_str: $player_stones stones $(player == g.curplayer ? "(you)" : "")")
  end
end

"""
print_points(g::Just4FunEnv)

Prints the points info (sum of fields with majority and the highest
field with majority) of each player.
"""
function print_points(g::Just4FunEnv)
  points, max_field_points = get_points_info(g)
  
  name_max_len = max([length(player_name(Player(i))) for i in 1:NUM_PLAYERS]...)

  println("Points inforamtion:")
  for player_index in 1:NUM_PLAYERS
    player = Player(player_index)
    sum_p = points[player_index]
    sum_len = length(string(max(points...)))
    max_p = max_field_points[player_index]
    max_len = length(string(max(max_field_points...)))
    is_self_str = g.curplayer == player ? "(you)" : ""
    name_str = lpad(player_name(player), name_max_len)
    sum_str = padded(sum_p; length=sum_len, padding_char=" ")
    max_str = padded(max_p; length=max_len, padding_char=" ")
    println("$name_str: $sum_str Points (max is $max_str) $is_self_str")
  end
end

"""
print_game_result(g::Just4FunEnv)

Prints the winner or draw notice.
"""
function print_game_result(g::Just4FunEnv)
  if g.winner == Player(YELLOW) ||
    g.winner == Player(RED)     ||
    (NUM_PLAYERS >= 3 && g.winner == Player(MAGENTA)) ||
    (NUM_PLAYERS == 4 && g.winner == Player(GREEN))
    println("$(player_name(g.winner)) has won!")
  elseif isempty(GI.available_actions(g))
    println("It's a draw!")
  end
end

function Base.show(io::IO, ::MIME"text/plain", s::Just4FunSpec)
  println(io, "initial_stack=$(convert(Stack{Int64}, collect(Iterators.reverse(s.initial_stack))))")
  println(io, "FIELD_VALUES=$(convert(Matrix{Int64}, FIELD_VALUES))")
  println(io, "DECK=$(DECK)")
  println(io, "SIZE_HAND=$(SIZE_HAND)")
  println(io, "WIN_LENGTH=$(WIN_LENGTH)")
end

function Base.show(io::IO, ::MIME"text/plain", s::Just4FunEnv)
  println(io, "stack=$(convert(Stack{Int64}, collect(Iterators.reverse(s.stack))))")
  println(io, "used_cards=$(convert(Vector{Int64}, s.used_cards))")
  println(io, "player_cards{1}=$(convert(Vector{Int64}, s.player_cards[:, 1]))")
  println(io, "player_cards{2}=$(convert(Vector{Int64}, s.player_cards[:, 2]))")
  println(io, "field_stones{1}=$(convert(Matrix{Int64}, s.field_stones[:, :, 1]))")
  println(io, "field_stones{2}=$(convert(Matrix{Int64}, s.field_stones[:, :, 2]))")
  println(io, "player_stones=$(convert(Vector{Int64}, s.player_stones))")
  println(io, "curplayer=$(convert(Int64, s.curplayer))")
  println(io, "action_masks{1}=$(s.action_masks[:, 1])")
  println(io, "action_masks{2}=$(s.action_masks[:, 2])")
  println(io, "state=$(s.state)")
  println(io, "winner=$(convert(Int64, s.winner))")
end

function Base.show(io::IO, ::MIME"text/plain", s::Just4FunEnvState)
  println(io, "stack=$(convert(Stack{Int64}, collect(Iterators.reverse(s.stack))))")
  println(io, "used_cards=$(convert(Vector{Int64}, s.used_cards))")
  println(io, "player_cards{1}=$(convert(Vector{Int64}, s.player_cards[:, 1]))")
  println(io, "player_cards{2}=$(convert(Vector{Int64}, s.player_cards[:, 2]))")
  println(io, "field_stones{1}=$(convert(Matrix{Int64}, s.field_stones[:, :, 1]))")
  println(io, "field_stones{2}=$(convert(Matrix{Int64}, s.field_stones[:, :, 2]))")
  println(io, "player_stones=$(convert(Vector{Int64}, s.player_stones))")
  println(io, "curplayer=$(convert(Int64, s.curplayer))")
end

function Base.show(io::IO, ::MIME"text/plain", s::CardsAction)
  println(io, "<$(convert(Vector{Int64}, s.cards))> ($(convert(Int64, s.value)))")
end


