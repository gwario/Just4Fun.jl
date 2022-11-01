module Just4Fun
using AlphaZero
using StaticArrays
using Combinatorics
using DataStructures
using Crayons
using Random
using SnoopPrecompile

@precompile_all_calls include("game/main.jl")

#precompile(Just4Fun.update_action_mask!,    (Just4FunEnv,))
#precompile(Base.setindex,   (StaticArraysCore.SMatrix{3924, 2, UInt8, 7848}, Bool, Int64))
#precompile(Base.setindex,   (StaticArraysCore.SMatrix{3924, 2, UInt8, 7848}, Bool, CartesianIndex{2}))
#precompile(Base.setindex,   (StaticArraysCore.SMatrix{3924, 2, UInt8}, Bool, Int64))
#precompile(getindex,        (StaticArraysCore.SMatrix{3924, 2, UInt8}, Colon, Int64))
#precompile(getindex,        (StaticArraysCore.SMatrix{4, 2, UInt8}, Colon, Int64))
#precompile(StaticArrays._mapfoldl,      (typeof(identity), typeof(+), Colon, StaticArrays._InitialValue, StaticArraysCore.Size{(3924,)}, StaticArraysCore.SVector{3924, UInt8}))
#precompile(StaticArrays._setindex,      (StaticArrays.Length{7848}, StaticArraysCore.SMatrix{3924, 2, UInt8, 7848}, UInt8, Int64))
#precompile(StaticArrays._setindex,      (StaticArrays.Length{7848}, StaticArraysCore.SMatrix{3924, 2, UInt8}, UInt8, Int64))
#precompile(StaticArrays._getindex,      (StaticArraysCore.SMatrix{3924, 2, UInt8}, Tuple{StaticArraysCore.Size{(3924,)}, StaticArraysCore.Size{()}}, Tuple{Colon, Int64}))
#precompile(StaticArrays._getindex,      (StaticArraysCore.SMatrix{3924, 2, UInt8, 7848}, Tuple{StaticArraysCore.Size{(3924,)}, StaticArraysCore.Size{()}}, Tuple{Colon, Int64}))
#precompile(StaticArrays._mapfoldl,      (Function, Function, Colon, StaticArrays._InitialValue, StaticArraysCore.Size{(3924,)}, StaticArraysCore.SVector{3924, UInt8}))
#precompile(StaticArrays._mapreduce,     (Function, Function, Function, StaticArrays._InitialValue, StaticArraysCore.Size{(3924,)}, StaticArraysCore.SVector{3924, UInt8}))
#precompile(StaticArrays._mapreduce,     (typeof(identity), typeof(+), Function, StaticArrays._InitialValue, StaticArraysCore.Size{(3924,)}, StaticArraysCore.SVector{3924, UInt8}))
#precompile(StaticArrays.unroll_tuple,   (Matrix{UInt8}, StaticArrays.Length{7848}))

export Just4FunEnv, Just4FunSpec, CardValue, Cards, Stones, FieldValue, CardsAction
export Player, YELLOW, RED, GREEN, MAGENTA, next_player, curplayercards, player_name
export GameState, in_progress, end_by_pattern, end_by_points, end_by_max_field, end_by_draw
export CARD_ACTION_SEPARATOR
# TODO: make configurable in spec maybe
export FIELD_VALUES, SIZE_HAND, SIDE_LENGTH, NUM_PLAYERS
export FEATURE_CARDS
end
