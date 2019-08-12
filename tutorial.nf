#!/usr/bin/env nextflow

/*
################
NEXTFLOW Global Config
################
*/

params.outdir = "results"

/*
################
GROOVY CODE (NATIVE)
################
*/

name = Channel.from( 'Clojure', 'ClojureScript', 'Scheme', 'OCaml')

process groovyPrintNames1 {
    scratch true

    input:
    val name

    exec:
    println "Hello Mr. $name"
}



/////////////////

num = Channel.from( 1, 2, 3 )

process basic_example {
  input:
  val num

  output:
  stdout basic_example

  "echo process job $num"

}

basic_example.println {it.trim()}

/////////////////

name = Channel.from( 'Clojure', 'ClojureScript', 'Scheme', 'OCaml')

process groovyPrintNames2 {
    input:
    val a_name from name

    // output:
    // stdout groovy_result

    exec:
    println "Hello Mr. $a_name"
}




/*
################
BASH SHELL
################
*/

process bashShell {

    output:
    stdout bashShell_result

    shell:
    """
    printf $SHELL
    """
}

bashShell_result.println { it.trim() }

/*
################
FISH SHELL
################
*/

process fishShell {

    output:
    stdout fishShell_result

    shell:
    """
    #!/usr/bin/env fish

    printf $SHELL
    """
}


fishShell_result.println { "FISH Shell: "+ it.trim() }


/*
################
GOLANG SCRIPT
################
*/

process GoScripts {

    output:
    stdout GoScripts_result

    shell:
    """
#!/usr/bin/env gorun

package main

import (
 "fmt"
 "os"
)

func main() {
 s := "GoLang"

 if len(os.Args) > 1 {
   s = os.Args[1]
 }

 fmt.Printf("Hello, %v!", s)
 fmt.Println("")

 if s == "fail" {
   os.Exit(30)
 }
}
    """
}


GoScripts_result.println { it.trim() }

/*
################
# PYTHON STUFF
################
*/

process pyStuff {

    output:
    stdout pyStuff_result

    """
    #!/usr/bin/env python3

    x = 'Hello, '
    y = 'World!'
    print(x+y)
    """
}

pyStuff_result.println { it.trim() }


/*
################
# OCAML STUFF
################
*/

process ocaml_process {

    output:
    stdout ocaml_process_result

    """
    #!/usr/bin/env ocaml

    print_string "Hello world!";;
    """

}

ocaml_process_result.println {"OCaml Results: " + it.trim() }
