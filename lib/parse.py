def read(s):
    "文字列からScheme式を読み込む。"
    return read_from(tokenize(s))
 
parse = read
 
def tokenize(s):
    "文字列をトークンのリストに変換する。"
    return s.replace('(',' ( ').replace(')',' ) ').split()
 
def read_from(tokens):
    "トークンの列から式を読み込む。"
    if len(tokens) == 0:
        raise SyntaxError('unexpected EOF while reading')
    token = tokens.pop(0)
    if '(' == token:
        L = []
        while tokens[0] != ')':
            L.append(read_from(tokens))
        tokens.pop(0) # pop off ')'
        return L
    elif ')' == token:
        raise SyntaxError('unexpected )')
    else:
        return atom(token)
 
def atom(token):
    "数は数にし、それ以外のトークンはシンボルにする。"
    try: return int(token)
    except ValueError:
        try: return float(token)
        except ValueError:
            return Symbol(token)
