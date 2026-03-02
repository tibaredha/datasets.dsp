#' activités bloc opératoire
#'
#' Look up bloc.
#'
#' @source DSP Djelfa
#' @format Data frame with 07 columns  and 51,397 rows
#' \describe{
#' \item{STRUCTURE}{établissement.}
#' \item{AGE}{age en année.}
#' \item{SEXE}{sexe.}
#' \item{DATE_INTERVENTION}{date intervention.}
#' \item{MEDECIN}{médecin.}
#' \item{DIAGNOSTIC}{diagnostic.}
#' \item{TYPE}{type.}
#' }
#' @examples
#'   bloc
"bloc"


#' ressource humaine
#'
#' Look up rh.
#'
#' @source DSP Djelfa
#' @format Data frame with 09 columns  and 9364 rows
#' \describe{
#' \item{wilaya}{wilaya.}
#' \item{structure}{structure.}
#' \item{sexe}{sexe.}
#' \item{datenaissance}{datenaissance.}
#' \item{grade}{grade.}
#' \item{specialité}{specialité.}
#' \item{nom}{nom.}
#' \item{prenom}{prenom.}
#' }
#' @examples
#'   rh
"rh"

#' mortalité hospitalière
#'
#' Look up deceshosp.
#'
#' @source DSP Djelfa
#' @format Data frame with 19 columns  and 20584 rows
#' \describe{
#' \item{DINS}{date déces.}
#' \item{DATENAISSANCE}{date de naissance.}
#' \item{SEX}{sexe.}
#' \item{Years}{age en année.}
#' \item{Days}{age en jours.}
#' \item{WILAYAR}{wilaya de résidence.}
#' \item{WILAYAS}{wilaya de naissance.}
#' \item{COMMUNER}{comuune de résidence.}
#' \item{COMMUNE}{commune de naissance.}
#' \item{LD}{lieux du déces.}
#' \item{structure}{établissement du déces.}
#' \item{service}{service du déces.}
#' \item{DUREEHOSPIT}{durée d'hospitalisation.}
#' \item{n_profession}{la profession.}
#' \item{CD}{cause du déces.}
#' \item{CHAP}{chapitre.}
#' \item{diag_cod}{code cim.}
#' \item{diag_nom}{dignostic.}
#' \item{MEDECINHOSPIT}{médecin.}
#' }
#' @examples
#'   deceshosp
"deceshosp"


#' géométrie wilayas
#'
#' Look up sig.w.
#'
#' @source DSP Djelfa
#' @format Data frame with 03 columns  and  48 rows
#' \describe{
#' \item{CC_1}{code wilaya.}
#' \item{NAME_1}{nom wilaya.}
#' \item{geometry}{geometry.}
#' }
#' @examples
#'   sig.w
"sig.w"


#' géométrie communes
#'
#' Look up sig.c.
#'
#' @source DSP Djelfa
#' @format Data frame with 04 columns  and  1504 rows
#' \describe{
#' \item{CC_2}{code commune.}
#' \item{NAME_1}{nom wilaya.}
#' \item{NAME_2}{nom commune.}
#' \item{geometry}{geometry.}
#' }
#' @examples
#'   sig.c
"sig.c"













