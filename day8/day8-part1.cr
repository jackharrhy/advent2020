enum Op
  Nop
  Acc
  Jmp
end

OP_MAP = {
  "nop" => Op::Nop,
  "acc" => Op::Acc,
  "jmp" => Op::Jmp
}

instructions = Array(NamedTuple(op: Op, value: Int32)).new

STDIN.each_line do |line|
  op, value = line.split(' ')
  instructions << NamedTuple.new(op: OP_MAP[op], value: value.to_i)
end

pc = 0
accumulator = 0

seen_instructions = [] of Int32

loop do
  if seen_instructions.includes?(pc)
    puts accumulator
    exit 0
  end

  seen_instructions << pc

  instruction = instructions[pc]

  case instruction[:op]
  when Op::Nop
    pc += 1
  when Op::Acc
    pc += 1
    accumulator += instruction[:value]
  when Op::Jmp
    pc += instruction[:value]
  end
end
