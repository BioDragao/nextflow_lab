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

// name = Channel.from( 'Clojure', 'ClojureScript', 'Scheme', 'OCaml')

// process groovyPrintNames1 {
//     scratch true

//     input:
//     val name

//     exec:
//     println "Hello Mr. $name"
// }


/*
################
# BASH SHELL
################
*/

// process bashShell {

//     output:
//     stdout bashShell_result

//     shell:
//     """
//     printf $SHELL
//     """
// }

// bashShell_result.println { it.trim() }

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

    rclone lsd onedrive-em:
    """
}


fishShell_result.println { "FISH Shell: "+ it.trim() }


