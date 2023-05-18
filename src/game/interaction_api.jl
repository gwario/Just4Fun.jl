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
    if !isnothing(spec.settings.cards)
        cards, value = played_cards_or_cell
        return string(join(sort(convert(Array{Int64}, cards)), " "), " -> $(padded(value))")
    else
        return string(convert(Int64, played_cards_or_cell))
    end
end 

GI.action_string(spec::Just4FunSpec, action::CardsAction) = string(join(sort(convert(Array{Int64}, action.cards)), " "), " -> $(padded(action.value))")
GI.action_string(spec::Just4FunSpec, action::NoCardsAction) = string(convert(Int64, action))

"""
GI.parse_action(spec::Just4FunSpec, string)::Union(Action,Nothing)

Parses the user input and returns the coresponding action - a combination of cards or a cell id!
TODO check if the action is valid in the game environment here or in play! or ignore it and let action_mask do the validating?
Tictactoe also only validated that its a number in the range of positions...
"""
function GI.parse_action(spec::Just4FunSpec, string)
    if !isnothing(spec.settings.cards)
        parse_action_cards(spec, string)
    else
        parse_action_cell_id(spec, string)
    end
end

"""
read_state(spec::Just4FunSpec)

Read a state from the standard input. Return the corresponding state (with type state_type(game_spec)) or nothing in case of an invalid input.
"""
GI.read_state(spec::Just4FunSpec) = read_state_non_interactive(spec)

"""
read_trace(game_spec::Just4FunSpec)

Read a trace from the standard input. Return the corresponding trace (with type state_type(game_spec)) or nothing in case of an invalid input.
"""
read_trace(spec::Just4FunSpec) = read_trace_non_interactive(spec)

"""
render(game::Just4FunEnv)
Print the game state on the standard output.
TODO: pass spec
"""
function GI.render(g::Just4FunEnv; with_position_names=true, botmargin=true, debug=false, player::Player=Player(RED))
    spec = GI.spec(g)
    pname = player_name(g.curplayer)
    board_size = size(spec.settings.board.value_distribution)
    its_me_playing = g.curplayer == player

    println()
    println("$pname plays:\n")

    for y in 1:board_size[1]
        if y == 1
            print_upper_border(board_size)
        end
        print_cell(spec, g, y)
        if y < board_size[1]
            print_middle_border(board_size)
        else
            print_lower_border(board_size)
        end  
    end

    botmargin && println()

    if GI.game_terminated(g)
        print_game_result(spec, g)
        # if debug print everything
        if debug && !isnothing(spec.settings.cards)
            #print_curplayer_possibly_available_cards(g)
            print_points(spec, g)
            println()
            println("Stones inforamtion:")
            print_player_remaining_stones(spec, g)
            println()
            println("Cards inforamtion:")
            print_playercards(spec, g)
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
            if its_me_playing && !isnothing(spec.settings.cards)
                #print_curplayer_possibly_available_cards(g)
                print_points(spec, g)
                println()
                println("Stones inforamtion:")
                print_player_remaining_stones(spec, g)
                println()
                println("Cards inforamtion:")
                print_curplayercards(g)
                print_used_cards(g)
                println()
                print_curplayer_actions(spec, g)
            end
        else
            # if debug, print all no matter whos turn
            if !isnothing(spec.settings.cards)
                #print_curplayer_possibly_available_cards(g)
                print_points(spec, g)
                println("Stones inforamtion:")
                print_player_remaining_stones(spec, g)
                println("Cards inforamtion:")
                print_playercards(spec, g)
                print_gamecards(g)
                print_used_cards(g)
                println()
                print_curplayer_actions(spec, g)
            end
        end
    end
end
