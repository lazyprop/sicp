- A frame is a table which maps variable names with values. Each frame also has
  a pointer to its enclosing environment.

- An environment is a sequence of frames. 

- The value for a variable is given by moving backwards (from the current frame
  to their enclosing environment) until we find a frame that contains a binding
  for that variable.

- Procedures are also treated similarly. The `define` expression evaluates the
  body of the procedure and maps binds it to the name of the procedure in the
  environment.

- A procedure is created by evaluating a lambda expression relative to a given
  environment. The resulting procedure object is a pair of the code of the
  lambda expression and a pointer to the environment.

- A procedure object is applied to a set of arguments by constructing a new
  frame in which the parameters of the procedure are bound to the values of the
  arguments and then the body of the procedure is evaluated in the new
  environment.

- `set!` finds the first frame in which the value was defined and modifies it in
  that frame.
