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

def haulting_value(instructions)
  pc = 0
  accumulator = 0

  seen_instructions = [] of Int32

  loop do
    return accumulator if pc >= instructions.size

    return nil if seen_instructions.includes?(pc)
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
end

instructions.each_with_index do |instruction, index|
  op = instruction[:op]
  next if op == Op::Acc

  modified_instructions = instructions.clone

  if op == Op::Nop
    modified_instruction = NamedTuple.new(op: Op::Jmp, value: instruction[:value])
    modified_instructions[index] = modified_instruction
  elsif op == Op::Jmp
    modified_instruction = NamedTuple.new(op: Op::Nop, value: instruction[:value])
    modified_instructions[index] = modified_instruction
  end

  if value = haulting_value(modified_instructions)
    puts value
    exit 0
  end
end

