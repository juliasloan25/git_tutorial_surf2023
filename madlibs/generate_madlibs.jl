using Random

# check that we are in the right directory
filename = "generate_madlibs.jl"
@assert isfile(filename) "You're running from the wrong directory. Please run from the \"madlibs\" folder."

word_types = ["verb", "noun", "number", "adjective"]

verbs = Vector{String}()
nouns = Vector{String}()
numbers = Vector{String}()
adjectives = Vector{String}()
word_arrays = Dict("verb" => verbs, "noun" => nouns, "number" => numbers, "adjective" => adjectives)

num_word_types = Dict("verb" => 6, "noun" => 9, "number" => 2, "adjective" => 3)

verbs_backup = ["runs", "heats up", "traverses", "leaves", "flies", "crumbles"]
nouns_backup = ["mouse", "chair", "helicopter", "water fountain", "tree", "top hat", "planet", "painting", "lake"]
numbers_backup = ["eighty-nine", "two thousand and one"]
adjectives_backup = ["round", "squishy", "salty"]

word_backups = Dict("verb" => verbs_backup, "noun" => nouns_backup, "number" => numbers_backup, "adjective" => adjectives_backup)

# go through text files in current directory
for file in readdir(".")
    if split(file, ".")[2] == "txt"
        for line in strip.(readlines(file))
            if !isempty(line)
                w, val = strip.(split(line, ": "))
                # fill arrays
                push!(word_arrays[w], val)
            end
        end

    end
end

# Check that we have enough words of each type for the story
for w in word_types
    arr = word_arrays[w]
    backups = word_backups[w]
    while length(arr) < num_word_types[w]
        push!(arr, backups[rand(1:length(backups))])
    end

    # Randomly reorder
    shuffle!(arr)
end




# Set up the story!
println("Every morning, Freddie Sanchez gets out of bed and " * verbs[1] *
" himself to work. He is always " *
numbers[1] * " minutes late. Once he " *
verbs[2] * " in the front door, he begins his routine. First, he talks to Hailey in the kitchen. Sometimes she’s cooking " *
nouns[1] * ", which always smells " *
adjectives[1] * ". After chatting with Hailey for a bit, Freddie " * verbs[3] *
" upstairs to get some work done. He spends a lot of time modeling " * nouns[2] *
" on his computer, which runs even more " * adjectives[2] * " on the cluster.\n")

println("When lunch time rolls around, Freddie always eats the same thing: a " * nouns[3] *
" sandwich, a " * nouns[4] * ", and a " * nouns[5] *
" for dessert. Whenever his SURF mentor " * verbs[4] * " around, Freddie pretends to " *
verbs[5] * ", if he's not in the middle of spending " * numbers[2] *
" minutes coordinating a walk to the turtle pond. Often, his mentor will ask him to " *
verbs[6] * " things, such as " * adjectives[3] * " " * nouns[6] * " and " * nouns[7] * ".\n")

println("Here are some important facts about Freddie:\n")
println("His favorite part of earth system modeling is the " * nouns[8] * ".\n")
println("He loves the color of " * nouns[9] * ".\n")
println("Despite his many quirks, Freddie is still appreciated as an important member
of the research team, especially because he knows Git.")
