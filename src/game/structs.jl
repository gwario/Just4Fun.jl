######################)
# Structures
####
using Base: @kwdef

@kwdef struct BoardSettings
    value_distribution::Matrix{Int} = JUST4FUN_DEFAULT_ORIGINAL_DIST
    length_win::Int = JUST4FUN_DEFAULT_WIN_LENGTH
    num_pieces::Int = JUST4FUN_DEFAULT_NUM_PLAYER_STONES
    single_piece::Bool = false
    count_values::Bool = true
end

@kwdef struct CardsSettings
    size_hand::Int = JUST4FUN_DEFAULT_SIZE_HAND
    deck::Vector{Int} = JUST4FUN_DEFAULT_DECK
end

@kwdef struct Just4FunSettings
    players::Int = 2
    board::BoardSettings = BoardSettings()
    cards::Union{CardsSettings,Nothing} = CardsSettings()
end

"""
Just4FunSpec(starting_player::Union{Nothing,Player}=Player(YELLOW), settings=Just4FunSettings())::Just4FunSpec
Just4FunSpec(per_game_seeds::Vector{Int64}, starting_player::Union{Nothing,Player}=Player(YELLOW), settings=Just4FunSettings())::Just4FunSpec
Just4FunSpec(predefined_stack::Stack{CardValue}, starting_player::Union{Nothing,Player}=Player(YELLOW), settings=Just4FunSettings())::Just4FunSpec
Just4FunSpec(predefined_stack::Stack{CardValue}, per_game_seeds::Vector{Int64}, starting_player::Union{Nothing,Player}=Player(YELLOW), settings=Just4FunSettings())::Just4FunSpec
"""
struct Just4FunSpec <: GI.AbstractGameSpec

    starting_player::Union{Nothing,Player}
    per_game_seeds::Vector{Int64}
    initial_stack::Stack{CardValue}

    settings::Just4FunSettings

    actions::Vector{Action}

    function Just4FunSpec(
        starting_player::Union{Nothing,Player} = Player(YELLOW),
        settings = Just4FunSettings(),
    )::Just4FunSpec
        @assert length(vec(settings.board.value_distribution)) ==
                length(unique(vec(settings.board.value_distribution)))

        actions =
            isnothing(settings.cards) ? generate_nocard_actions(settings) :
            generate_card_actions(settings)
        new(starting_player, Int64[], Stack{CardValue}(), settings, actions)
    end

    function Just4FunSpec(
        per_game_seeds::Vector{Int64},
        starting_player::Union{Nothing,Player} = Player(YELLOW),
        settings = Just4FunSettings(),
    )::Just4FunSpec
        @assert length(vec(settings.board.value_distribution)) ==
                length(unique(vec(settings.board.value_distribution)))

        actions =
            isnothing(settings.cards) ? generate_nocard_actions(settings) :
            generate_card_actions(settings)
        new(starting_player, per_game_seeds, Stack{CardValue}(), settings, actions)
    end

    function Just4FunSpec(
        predefined_stack::Stack{CardValue},
        starting_player::Union{Nothing,Player} = Player(YELLOW),
        settings = Just4FunSettings(),
    )::Just4FunSpec
        @assert length(vec(settings.board.value_distribution)) ==
                length(unique(vec(settings.board.value_distribution)))

        actions =
            isnothing(settings.cards) ? generate_nocard_actions(settings) :
            generate_card_actions(settings)
        new(starting_player, Int64[], predefined_stack, settings, actions)
    end

    function Just4FunSpec(
        predefined_stack::Stack{CardValue},
        per_game_seeds::Vector{Int64},
        starting_player::Union{Nothing,Player} = Player(YELLOW),
        settings = Just4FunSettings(),
    )::Just4FunSpec
        @assert length(vec(settings.board.value_distribution)) ==
                length(unique(vec(settings.board.value_distribution)))

        actions =
            isnothing(settings.cards) ? generate_nocard_actions(settings) :
            generate_card_actions(settings)
        new(starting_player, per_game_seeds, predefined_stack, settings, actions)
    end
end

mutable struct Just4FunEnv <: GI.AbstractGameEnv

    # state
    stack::Stack{CardValue}
    used_cards::Cards                      # the played cards, for convenience
    player_cards::AbstractMatrix{CardValue}  # the players' cards Size <size hand> x <players> (x 1)
    field_stones::AbstractArray{Stones}      # Size <board_side> x <board_side> x <players> (x 1)
    player_stones::AbstractVector{Stones}     # Size <players> (x 1)
    curplayer::Player
    # status helpers
    actions_masks::BitArray{2}   # Action masks for each players Size <num actions> x <players> (x 1)
    board_actions_masks::BitArray{3}   # Board position masks for each players Size <y_len> x <x_len> x <players> (x 1)
    state::GameState
    winner::Player

    # Used for precise stats on game end and number of regular
    action_indices::Vector{Int64} # The indices of the played actions in the action mask. can be looked up efficiently via the map

end
