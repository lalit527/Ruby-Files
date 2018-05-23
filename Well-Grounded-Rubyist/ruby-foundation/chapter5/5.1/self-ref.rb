"""
##Self Reference
Top level of Program -> main(built-in top level default object)
Class definition     -> The class object
Module Definition    -> The module object
Method definition    -> Top-level -> Whatever object is self when the method is called;
                     -> Instance Method -> An instance of C
                     -> Instance method definition in module -> 1) individual object extended by Module
                                                            -> 2) Instance of class that mixes M
"""

puts self