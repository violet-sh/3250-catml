open Lang

let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let eval (s: string) =
  let ast = parse(s) in
  print_endline(string_of_expr (multistep ast))

let interpret_file(s: string) =
  let file = open_in s in
  let contents = In_channel.input_all file in
  eval contents
