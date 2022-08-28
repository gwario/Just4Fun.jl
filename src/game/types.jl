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
const CardsAction   = NamedTuple{(:cards, :value), Tuple{Union{Cards}, Union{FieldValue}}}

const Action = Union{CardsAction, NoCardsAction}


for T in [
    CardsAction
  ]
    @eval JSON3.StructType(::Type{<:$T}) = JSON3.Struct()
end