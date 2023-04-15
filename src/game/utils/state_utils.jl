"""
read_state_interactive(spec::Just4FunSpec)
Returns the board state.

Blank lines are ignored.
One row per player and field for the stones.
One line for each player's cards.
One line for the cards on the stack and one line for the used cards.
"""
function read_state_interactive(spec::Just4FunSpec)
    board_size = spec.settings.board.dimensions
    field_stones = @SArray zeros(Stones, board_size[1], board_size[2], spec.settings.players)
    player_stones = SVector{spec.settings.players}(repeat([Stones(spec.settings.board.num_pieces)], spec.settings.players))
    player_cards = !isnothing(spec.settings.cards) ? (@SMatrix zeros(CardValue, spec.settings.cards.size_hand, spec.settings.players)) : (@SMatrix zeros(CardValue, 2, 2))
    stack = Vector{CardValue}()
    used_cards = Cards()
    curplayer = Player(0)
    state::GameState = in_progress
    action_indices = Vector{Int64}()

    # field stones and player stones
    n_lines = board_size[1] * spec.settings.players
    i_line = 1
    while i_line <= n_lines
        i_player = 1 + (i_line - 1) % spec.settings.players
        i_row = 1 + trunc(Int, (i_line - 1) / spec.settings.players)
        
        print("Row $i_row for player $i_player: ")
        fields_stones_player_str = strip(readline())
        
        isempty(fields_stones_player_str) && continue
        
        fields_stones_player = map(s -> parse(Stones, s), split(fields_stones_player_str))

        if length(fields_stones_player) != board_size[1]
            @error "Only $(length(fields_stones_player)) out of $(board_size[1]) fields provided!"
            continue
        end
        
        for (i_col, n_stones) in enumerate(fields_stones_player)
            player_field_index = CartesianIndex(i_col, i_row, i_player)
            field_stones = setindex(field_stones, n_stones, player_field_index)
        end
        
        new_player_stones = player_stones[i_player] - sum(fields_stones_player)
        player_stones = setindex(player_stones, new_player_stones, i_player)
        
        i_line += 1
    end
    
    if !isnothing(spec.settings.cards)
        # player cards
        n_lines = spec.settings.players
        i_line = 1
        while i_line <= n_lines
            i_player = i_line

            print("Player $i_player cards: ")
            cards_str = strip(readline())

            isempty(cards_str) && continue
            
            cards = map(c -> parse(CardValue, c), split(cards_str))

            if length(cards) != spec.settings.cards.size_hand
                @error "Only $(length(cards)), not $(spec.settings.cards.size_hand) cards provided!"
                continue
            end
            
            for (i_card, card) in enumerate(sort(cards))
                player_card_index = CartesianIndex(i_card, i_player)
                player_cards = setindex(player_cards, card, player_card_index)
            end

            i_line += 1
        end

        # stack cards
        print("Stack cards: ")
        cards_str = strip(readline())
        foreach(c -> push!(stack, parse(CardValue, c)), reverse(split(cards_str)))

        # used cards
        print("Used cards: ")
        cards_str = strip(readline())
        foreach(c -> push!(used_cards, parse(CardValue, c)), reverse(split(cards_str)))
    end

    curplayer = Player(argmax(player_stones))

    return (
        stack         = stack,
        used_cards    = used_cards,
        player_cards  = player_cards,
        
        field_stones  = field_stones,
    
        player_stones = player_stones,
        curplayer     = curplayer,

        state           = state,
        action_indices  = action_indices
    )
end

"""
read_state_non_interactive(spec::Just4FunSpec)
Returns the board state.

Blank lines and lines starting with '#' are ignored.
One row per player and field for the stones.
One line for each player's cards.
One line for the cards on the stack and one line for the used cards.

For 3 players and 4x4 board e.g.:
 <p1,f1> <p1,f2> <p1,f3> <p1,f4>\n
 <p2,f1> <p2,f2> <p2,f3> <p2,f4>\n
 <p3,f1> <p3,f2> <p3,f3> <p3,f4>\n
 \n
 <p1,f5> <p1,f6> <p1,f7> <p1,f8>\n
 <p2,f5> <p2,f6> <p2,f7> <p2,f8>\n
 <p3,f5> <p3,f6> <p3,f7> <p3,f8>\n
 \n
 <p1,f9> <p1,f10> <p1,f11> <p1,f12>\n
 <p2,f9> <p2,f10> <p2,f11> <p2,f12>\n
 <p3,f9> <p3,f10> <p3,f11> <p3,f12>\n
 \n
 <p1,f13> <p1,f14> <p1,f15> <p1,f16>\n
 <p2,f13> <p2,f14> <p2,f15> <p2,f16>\n
 <p3,f13> <p3,f14> <p3,f15> <p3,f16>\n
 \n
 <p1c1> <p1c2> ... <p1cn>\n
 <p2c1> <p2c2> ... <p2cn>\n
 <p3c1> <p3c2> ... <p3cn>\n
 \n
 <sc1> <sc2> ... <scn>\n
 <uc1> <uc2> ... <ucn>\n
"""
function read_state_non_interactive(spec::Just4FunSpec)
    
    valid_command(input::String) = input != "" ? input != "file" ? input != "stdin" ? false : true : true : true

    print("Read from file or stdin? (FILE/stdin) ")
    input = "-"
    while !valid_command(input)
        input = lowercase(strip(readline()))
    end

    if isempty(input) || input == "file"
        file_path_valid = false
        file_path = "-"
        while !file_path_valid
            print("Enter file path (absolute or relative to $(pwd())): ")
            file_path = strip(readline())
            try
                file_path_valid = isfile(file_path)
            catch e
                @error e.msg
            end 
        end
        lines = reverse(filter(not_comment, chomp.(readlines(file_path))))
    else
        println("Enter the full state at once and submit by pressing Enter and Ctrl-D")
        lines = reverse(filter(not_comment, chomp.(readlines())))
    end
    #dump(lines)
    return _read_state!(spec, lines)
end

"""
write_state_non_interactive(spec::Just4FunSpec, game::Just4FunEnv)
"""
function write_state_non_interactive(spec::Just4FunSpec, game::Just4FunEnv)

    valid_command(input::String) = input != "" ? input != "file" ? input != "stdout" ? false : true : true : true

    print("Write from file or stdout? (FILE/stdout) ")
    input = "-"
    while !valid_command(input)
        input = lowercase(strip(readline()))
    end

    if isempty(input) || input == "file"
        print("Enter file path (absolute or relative to $(pwd())): ")
        file_path = strip(readline())
        isempty(file_path) && return # abort if empty
        open(file_path, "w") do io
            _write_state!(io, spec, game)
            println("Successfully saved the current state to $(file_path).")
        end
    else
        println("The current state is:")
        _write_state!(stdout, spec, game)
    end
end

not_comment(input::Union{String, SubString{String}}) = !isempty(input) && !startswith(input, "#")

"""
read_trace_non_interactive(spec::Just4FunSpec)
Returns the game trace.

Blank lines and lines starting with '#' are ignored.
Uses the same format as `read_state_non_interactive(spec::Just4FunSpec)`

<initial state>\n
<policy 1>\n
<reward 1>\n
<after state 1>\n
<policy 2>\n
<reward 2>\n
<after state 2>\n
...
"""
function read_trace_non_interactive(spec::Just4FunSpec)

    valid_command(input::String) = input != "" ? input != "file" ? input != "stdin" ? false : true : true : true
    

    print("Read from file or stdin? (FILE/stdin) ")
    input = "-"
    while !valid_command(input)
        input = lowercase(strip(readline()))
    end

    if isempty(input) || input == "file"
        file_path_valid = false
        file_path = "-"
        while !file_path_valid
            print("Enter file path (absolute or relative to $(pwd())): ")
            file_path = strip(readline())
            try
                file_path_valid = isfile(file_path)
            catch e
                @error e.msg
            end 
        end
        lines = reverse(filter(not_comment, chomp.(readlines(file_path))))
    else
        println("Enter the full trace at once and submit by pressing Enter and Ctrl-D")
        lines = reverse(filter(not_comment, chomp.(readlines())))
    end

    # Read initial state
    initial_state = _read_state!(spec, lines)
    trace = Trace(initial_state)
    # Read trace element
    while !isempty(lines)
        policy = _read_policy!(lines)
        reward = _read_reward!(lines)
        state = _read_state!(spec, lines)
        push!(trace, policy, reward, state)
    end

    return trace
end


"""
_read_state!(spec::Just4FunSpec, lines::Vector{SubString{String}})

Reads a single state from an array of strings (removing them).
"""
function _read_state!(spec::Just4FunSpec, lines::Vector{SubString{String}})::Just4FunEnvState
    board_size = spec.settings.board.dimensions
    field_stones = @SArray zeros(Stones, board_size[1], board_size[2], spec.settings.players)
    player_stones = SVector{spec.settings.players}(repeat([Stones(spec.settings.board.num_pieces)], spec.settings.players))
    player_cards = !isnothing(spec.settings.cards) ? (@SMatrix zeros(CardValue, spec.settings.cards.size_hand, spec.settings.players)) : (@SMatrix zeros(CardValue, 2, 2))
    stack = Vector{CardValue}()
    used_cards = Cards()
    curplayer = Player(0)
    state::GameState = in_progress
    winner = Player(0)
    action_indices = Vector{Int64}()

    # field stones and player stones
    n_lines = board_size[1] * spec.settings.players
    i_line = 1
    while i_line <= n_lines
        i_player = 1 + (i_line - 1) % spec.settings.players
        i_row = 1 + trunc(Int, (i_line - 1) / spec.settings.players)
        
        line = strip(pop!(lines))
        @debug "Parsed row $i_row for player $i_player: $line"
        
        fields_stones_player = map(s -> parse(Stones, s), split(line))

        if length(fields_stones_player) != board_size[1]
            @error "Only $(length(fields_stones_player)) out of $(board_size[1]) fields provided!"
        end
        
        for (i_col, n_stones) in enumerate(fields_stones_player)
            player_field_index = CartesianIndex(i_col, i_row, i_player)
            field_stones = setindex(field_stones, n_stones, player_field_index)
        end
        
        new_player_stones = player_stones[i_player] - sum(fields_stones_player)
        player_stones = setindex(player_stones, new_player_stones, i_player)
        
        i_line += 1
    end

    # player cards
    if !isnothing(spec.settings.cards)
        n_lines = spec.settings.players
        i_line = 1
        while i_line <= n_lines
            i_player = i_line

            line = strip(pop!(lines))
            @debug "Parsed player $i_player cards: "
            
            cards = map(c -> parse(CardValue, c), split(line))

            if length(cards) != spec.settings.cards.size_hand
                @error "Only $(length(cards)), not $(spec.settings.cards.size_hand) cards provided!"
            end
            
            for (i_card, card) in enumerate(sort(cards))
                player_card_index = CartesianIndex(i_card, i_player)
                player_cards = setindex(player_cards, card, player_card_index)
            end

            i_line += 1
        end

    
        # stack cards - if not provided, it might be an empty line which got chomped to no line
        if !isempty(lines)
            line = strip(pop!(lines))
            @debug "Parsed stack cards: $line"
            foreach(c -> push!(stack, parse(CardValue, c)), reverse(split(line)))
        end
        # used cards - if not provided, it might be an empty line which got chomped to no line
        if !isempty(lines)
            line = strip(pop!(lines))
            @debug "Parsed used cards: $line"
            foreach(c -> push!(used_cards, parse(CardValue, c)), reverse(split(line)))
        end
    end
    # current player
    curplayer = Player(argmax(player_stones))
    
    # state
    # action indeices
    
    return (
        stack           = stack,
        used_cards      = used_cards,
        player_cards    = player_cards,
        
        field_stones    = field_stones,

        player_stones   = player_stones,
        curplayer       = curplayer,

        state           = state,
        winner          = winner,
        action_indices  = action_indices
    )
end

"""
_read_policy!(lines::Vector{SubString{String}})::Vector{Float32}

Reads the policy line.
"""
function _read_policy!(lines::Vector{SubString{String}})::Vector{Float32}
    policy = Vector{Float32}()
    line = strip(pop!(lines))
    @debug "Parsed policy: $line"
    foreach(p -> push!(policy, parse(Float32, p)), split(line))
    return policy
end

"""
_read_reward!(lines::Vector{SubString{String}})::Vector{Float32}

Reads the reward line.
"""
function _read_reward!(lines::Vector{SubString{String}})::Float32
    reward = parse(Float32, strip(pop!(lines)))
    @debug "Parsed reward: $reward"
    return reward
end

"""
_write_state!(spec::Just4FunSpec, game::Just4FunEnv)

Writes the state to stdout.
"""
_write_state!(spec::Just4FunSpec, game::Just4FunEnv) = _write_state!(stdout, spec, game)

"""
_write_state!(io::IO, spec::Just4FunSpec, game::Just4FunEnv)

Writes the state to the specified stream.
"""
function _write_state!(io::IO, spec::Just4FunSpec, game::Just4FunEnv)

    clone = GI.clone(game)
    # stones
    println(io, "# ### Stones")
    for x in 1:spec.settings.board.dimensions[1]
        for p_idx in 1:spec.settings.players
            println(io, "# Column $x, player $p_idx:")
            println(io, join([convert(Int64, clone.field_stones[y, x, p_idx]) for y in 1:spec.settings.board.dimensions[1]], " "))
        end
    end
    
    if !isnothing(spec.settings.cards)
        # player cards
        println(io, "# ### Player cards")
        for p_idx in 1:spec.settings.players
            println(io, "# Player $p_idx cards:")
            println(io, join(convert(Vector{Int64}, [clone.player_cards[card_idx, p_idx] for card_idx in 1:spec.settings.cards.size_hand]), " "))
        end

        # stack cards
        #@show clone.stack
        #dump(clone.stack)
        println(io, "# ### Stack cards")
        println(io, join(Vector{Int64}([c for c in Iterators.reverse(clone.stack)]), " "))
        
        #@show clone.used_cards
        #dump(clone.used_cards)
        # used cards
        println(io, "# ### Used cards")
        println(io, join(Vector{Int64}([c for c in reverse(clone.used_cards)]), " "))
    end
end