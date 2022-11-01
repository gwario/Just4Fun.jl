const CARD_ACTION_SEPARATOR = ' '
const CARD_LABEL_PADDING = ' '

include("utils/rendering_utils.jl")
include("utils/parsing_utils.jl")
include("utils/state_utils.jl")

"""
GI.action_string(::Just4FunSpec, played_cards_or_cell)

Return a human-readable string representing the provided action.
"""
function GI.action_string(spec::Just4FunSpec, played_cards_or_cell)
    if FEATURE_CARDS
        cards, value = played_cards_or_cell
        return string(join(sort(convert(Array{Int64}, cards)), " "), " -> $(padded(value))")
    else
        return convert(Int64, played_cards_or_cell)
    end
end 
  
"""
GI.parse_action(spec::Just4FunSpec, string)::Union(Action,Nothing)

Parses the user input and returns the coresponding action - a combination of cards or a cell id!
TODO check if the action is valid in the game environment here or in play! or ignore it and let action_mask do the validating?
Tictactoe also only validated that its a number in the range of positions...
"""
function GI.parse_action(spec::Just4FunSpec, string)
    if FEATURE_CARDS
        parse_action_cards(spec, string)
    else
        parse_action_cell_id(spec, string)
    end
end

"""
read_state(spec::Just4FunSpec)

Read a state from the standard input. Return the corresponding state (with type state_type(game_spec)) or nothing in case of an invalid input.
"""
function GI.read_state(spec::Just4FunSpec)
    
    valid_command(input::String) = input != "" ? input != "yes" ? input != "no" ? false : true : true : true
    
    print("Enter interacive mode? (yes/NO) ")
    input = "-"
    while !valid_command(input)
        input = lowercase(strip(readline()))
    end
 
    if input == "yes"
        state = read_state_interactive(spec)
    elseif isempty(input) || input == "no"
        state = read_state_non_interactive(spec)
    end
    return state
end

"""
read_trace(game_spec::Just4FunSpec)

Read a trace from the standard input. Return the corresponding trace (with type state_type(game_spec)) or nothing in case of an invalid input.
"""
function read_trace(spec::Just4FunSpec)
    
    valid_command(input::String) = input != "" ? input != "yes" ? input != "no" ? false : true : true : true
    
    print("Enter interacive mode? (yes/NO) ")
    input = "-"
    while !valid_command(input)
        input = lowercase(strip(readline()))
    end
 
    if input == "yes"
        trace = read_trace_interactive(spec)
    elseif isempty(input) || input == "no"
        trace = read_trace_non_interactive(spec)
    end
    @show trace
    return trace
end

"""
render(game::Just4FunEnv)
Print the game state on the standard output.
"""
function GI.render(g::Just4FunEnv; with_position_names=true, botmargin=true, debug=false, player::Player=Player(RED))
    pname = player_name(g.curplayer)
    board_size = size(FIELD_VALUES)
    its_me_playing = g.curplayer == player

    println()
    println("$pname plays:\n")

    for y in 1:SIDE_LENGTH
        if y == 1
            print_upper_border(board_size)
        end
        print_cell(g, board_size, y)
        if y < board_size[1]
            print_middle_border(board_size)
        else
            print_lower_border(board_size)
        end  
    end

    botmargin && println()

    if GI.game_terminated(g)
        print_game_result(g)
        # if debug print everything
        if debug && FEATURE_CARDS
            #print_curplayer_possibly_available_cards(g)
            print_points(g)
            println()
            println("Stones inforamtion:")
            print_player_remaining_stones(g)
            println()
            println("Cards inforamtion:")
            print_playercards(g)
            println()
            print_gamecards(g)
            print_used_cards(g)
        end
    end

    if !GI.game_terminated(g) 
        # game is still on
        println("$(player_name(g.curplayer))'s turn ($(its_me_playing ? "you" : "other player")).")
        println()
        if !debug
            # human's turn
            if its_me_playing && FEATURE_CARDS
                #print_curplayer_possibly_available_cards(g)
                print_points(g)
                println()
                println("Stones inforamtion:")
                print_player_remaining_stones(g)
                println()
                println("Cards inforamtion:")
                print_curplayercards(g)
                print_used_cards(g)
                println()
                print_curplayer_actions(g)
            end
        else
            # if debug, print all no matter whos turn
            if FEATURE_CARDS
                #print_curplayer_possibly_available_cards(g)
                print_points(g)
                println("Stones inforamtion:")
                print_player_remaining_stones(g)
                println("Cards inforamtion:")
                print_playercards(g)
                print_gamecards(g)
                print_used_cards(g)
                println()
                print_curplayer_actions(g)
            end
        end
    end
end
