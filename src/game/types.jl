using JSON3

######################
# Type definitions
####
const FieldValue  = UInt8
const CardValue   = FieldValue
const Cards       = Vector{CardValue}
const Player      = UInt8 #TODO: make enum as well
const Stones      = UInt8

@enum GameState::UInt8 begin
    in_progress         = 0x0
    end_by_pattern      = 0x1
    end_by_points       = 0x2
    end_by_max_field    = 0x3
    end_by_draw         = 0x4
end

const NoCardsAction = FieldValue
const CardsAction   = NamedTuple{(:cards, :value), Tuple{Cards, FieldValue}}

const Action = Union{CardsAction, NoCardsAction}

const Just4FunEnvState = NamedTuple{
  (
    :stack, :used_cards, :player_cards,
    :field_stones, :player_stones, :curplayer, :state, :winner, :action_indices
  ),
  Tuple{
    Vector{UInt8}, Vector{UInt8}, StaticArraysCore.SMatrix{SIZE_HAND, NUM_PLAYERS, UInt8, SIZE_HAND * NUM_PLAYERS},
    StaticArraysCore.SArray{Tuple{SIDE_LENGTH, SIDE_LENGTH, NUM_PLAYERS}, UInt8, 3, NUM_PLAYERS * SIDE_LENGTH^2},
    StaticArraysCore.SVector{NUM_PLAYERS, UInt8}, UInt8, GameState, UInt8, Vector{Int64}
  }
 }


for T in [
    CardsAction
  ]
    @eval JSON3.StructType(::Type{<:$T}) = JSON3.Struct()
end